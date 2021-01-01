import 'package:sqflite/sqflite.dart';

import '../../entities/board.dart';
import '../../entities/entity_page.dart';
import '../../entities/entity_portion.dart';
import '../../entities/thread.dart';
import 'fchan_database.dart';

const String _sqfliteDbName = 'fchan.db';

const int _version1 = 1;
const int _currentVersion = _version1;

class SQFLiteDatabase extends FChanDatabase {
  static final _favoriteBoardsCache = <String, Board>{};

  Database _database;

  @override
  Future<FChanDatabase> init() async {
    _database = await openDatabase(
      _sqfliteDbName,
      version: _currentVersion,
      onCreate: (db, version) async {
        await Future.wait(
          [
            db.execute(createBoardTable()),
            db.execute(createThreadTable()),
          ],
        );
      },
    );
    return this;
  }

  @override
  Future<void> close() => _database.close();

  @override
  Future<List<Board>> favoriteBoards() async {
    if (_favoriteBoardsCache.isEmpty) {
      await _database.query(
        tableBoard,
        where: '$columnBoardIsFavorite = ?',
        whereArgs: [1],
      ).then((rawBoards) {
        final boards =
        rawBoards.map((rawBoard) => Board.fromJson(rawBoard)).toList();
        boards.forEach((board) => _favoriteBoardsCache[board.board] = board);
      });
    }
    return _favoriteBoardsCache.values.toList();
  }

  @override
  Future<Board> addToFavorites(Board board) {
    board.isFavorite = true;
    if (board.isNew()) {
      return _database
          .insert(
        tableBoard,
        board.toJson(),
      )
          .then((boardId) {
        board.id = boardId;
        _favoriteBoardsCache[board.board] = board;
        return board;
      });
    } else {
      return _database
          .update(
            tableBoard,
            board.toJson(),
          )
          .then((boardId) => board);
    }
  }

  @override
  Future<Board> removeFromFavorites(Board board) {
    board.isFavorite = false;
    _favoriteBoardsCache.remove(board);
    return _database.delete(
      tableBoard,
      where: '$columnId = ?',
      whereArgs: [board.id],
    ).then((boardId) {
      board.id = null;
      return board;
    });
  }

  @override
  Future<EntityPortion<Thread>> historyThreads(EntityPage entityPage) {
    return _database
        .query(
      tableThread,
      orderBy: '$columnThreadLastSeenDate desc',
      limit: 15,
      offset: entityPage.page,
    )
        .then((rawThreads) async {
      final result = <Thread>[];
      for (var rawThread in rawThreads) {
        final boardId = rawThread[columnThreadBoardId];
        final board = _favoriteBoardsCache.isEmpty
            ? await _boardById(boardId)
            : _favoriteBoardsCache.values.firstWhere((board) => board.id == boardId);
        result.add(threadFromDb(rawThread, board));
      }
      return EntityPortion(
        result,
        result.isEmpty || result.length < 15,
      );
    });
  }

  Future<Board> _boardById(int boardId) {
    return _database.query(
      tableBoard,
      where: '$columnId = ?',
      whereArgs: [boardId],
    ).then((rawBoard) => Board.fromJson(rawBoard.first));
  }

  @override
  Future<Thread> threadFromHistory(Thread thread) {
    return _database.query(
      tableThread,
      where: '$columnThreadUrl = ?',
      whereArgs: ['\'${thread.threadUrl}\''],
    ).then((rawThreadResult) async {
      if (rawThreadResult.isEmpty) {
        return null;
      }
      final rawThread = rawThreadResult.first;
      final boardId = rawThread[columnThreadBoardId];
      final board = _favoriteBoardsCache.isEmpty
          ? await _boardById(boardId)
          : _favoriteBoardsCache.values.firstWhere((board) => board.id == boardId);
      return threadFromDb(rawThread, board);
    });
  }

  @override
  Future<bool> containsInHistory(Thread thread) {
    return _database.query(
      tableThread,
      where: '$columnThreadUrl = ?',
      whereArgs: [thread.threadUrl],
    ).then((value) => value.isNotEmpty);
  }

  @override
  Future<Thread> addToHistory(Thread thread) async {
    if (thread.isNew()) {
      return _database
          .insert(
        tableThread,
        threadToDb(thread),
      )
          .then((threadId) {
        thread.id = threadId;
        return thread;
      });
    }
    return thread;
  }

  @override
  Future<Thread> removeFromHistory(Thread thread) {
    return _database.delete(
      tableThread,
      where: '$columnId = ?',
      whereArgs: [thread.id],
    ).then((value) => thread);
  }
}

const tableBoard = 'board';
const tableThread = 'thread';

const columnId = 'id';

const columnBoardName = 'board';
const columnBoardTitle = 'title';
const columnBoardIsFavorite = 'is_favorite';

const columnThreadBoardId = 'board_id';
const columnThreadUrl = 'thread_url';
const columnThreadNo = 'no';
const columnThreadSub = 'sub';
const columnThreadCom = 'com';
const columnThreadTimeFromPublish = 'time_from_publish';
const columnThreadReplies = 'replies';
const columnThreadImages = 'images';
const columnThreadFilename = 'filename';
const columnThreadImageWidth = 'image_width';
const columnThreadImageHeight = 'image_height';
const columnThreadThumbnailImageWidth = 'thumbnail_image_width';
const columnThreadThumbnailImageHeight = 'thumbnail_image_height';
const columnThreadExt = 'ext';
const columnThreadLastSeenDate = 'last_seen_date';

String createBoardTable() {
  return 'create table $tableBoard('
      '$columnId integer primary key autoincrement,'
      '$columnBoardName text,'
      '$columnBoardTitle text,'
      '$columnBoardIsFavorite int'
      ');';
}

String createThreadTable() {
  return 'create table $tableThread('
      '$columnId integer primary key autoincrement,'
      '$columnThreadBoardId integer,'
      '$columnThreadUrl text,'
      '$columnThreadNo int,'
      '$columnThreadSub text,'
      '$columnThreadCom text,'
      '$columnThreadTimeFromPublish int,'
      '$columnThreadReplies int,'
      '$columnThreadImages int,'
      '$columnThreadFilename text,'
      '$columnThreadImageWidth int,'
      '$columnThreadImageHeight int,'
      '$columnThreadThumbnailImageWidth int,'
      '$columnThreadThumbnailImageHeight int,'
      '$columnThreadExt text,'
      '$columnThreadLastSeenDate text'
      ');';
}

Map<String, dynamic> threadToDb(Thread thread) {
  return {
    columnId: thread.id,
    columnThreadBoardId: thread.board.id,
    columnThreadUrl: thread.threadUrl,
    columnThreadNo: thread.no,
    columnThreadSub: thread.sub,
    columnThreadCom: thread.com,
    columnThreadTimeFromPublish: thread.timeFromPublish.inSeconds,
    columnThreadReplies: thread.replies,
    columnThreadImages: thread.images,
    columnThreadFilename: thread.filename,
    columnThreadImageWidth: thread.imageWidth,
    columnThreadImageHeight: thread.imageHeight,
    columnThreadThumbnailImageWidth: thread.thumbnailImageWidth,
    columnThreadThumbnailImageHeight: thread.thumbnailImageHeight,
    columnThreadExt: thread.ext,
    // TODO: refactor
    columnThreadLastSeenDate: DateTime.now().toIso8601String(),
  };
}

Thread threadFromDb(Map<String, dynamic> data, Board board) {
  return Thread(
    board,
    data[columnThreadUrl],
    data[columnThreadNo],
    data[columnThreadSub],
    data[columnThreadCom],
    Duration(seconds: data[columnThreadTimeFromPublish]),
    data[columnThreadReplies],
    data[columnThreadImages],
    data[columnThreadFilename],
    data[columnThreadImageWidth],
    data[columnThreadImageHeight],
    data[columnThreadThumbnailImageWidth],
    data[columnThreadThumbnailImageHeight],
    data[columnThreadExt],
    id: data[columnId],
  );
}
