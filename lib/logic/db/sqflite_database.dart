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
  static final _boardsCache = <String, Board>{};

  Database _sqflite;

  @override
  Future<FChanDatabase> init() async {
    _sqflite = await openDatabase(
      _sqfliteDbName,
      version: _currentVersion,
      onCreate: (db, version) async {
        await Future.wait([
          db.execute(createBoardTable()),
          db.execute(createThreadTable()),
        ]);
      }
    );
    return this;
  }

  @override
  Future<void> close() => _sqflite.close();

  @override
  Future<EntityPortion<Board>> favoriteBoards(EntityPage entityPage) async {
    if (_boardsCache.isNotEmpty) {
      return EntityPortion(
        _boardsCache.values.where((board) => board.isFavorite).toList(),
        true,
      );
    }
    return _sqflite.query(
      tableBoard,
      where: '$columnBoardIsFavorite = ?',
      whereArgs: [1],
    ).then((rawBoards) {
      final boards = rawBoards.map((rawBoard) => boardFromDb(rawBoard)).toList();
      boards.forEach((board) => _boardsCache[board.board] = board);
      return EntityPortion(
        _boardsCache.values.toList(),
        true,
      );
    });
  }

  @override
  Future<Board> addToFavorites(Board board) {
    board.isFavorite = true;
    if (board.isNew()) {
      return _sqflite.insert(
        tableBoard,
        boardToDb(board),
      ).then((boardId) {
        board.id = boardId;
        _boardsCache[board.board] = board;
        return board;
      });
    } else {
      return _sqflite.update(
        tableBoard,
        boardToDb(board),
      ).then((boardId) => board);
    }
  }

  @override
  Future<Board> removeFromFavorites(Board board) {
    board.isFavorite = false;
    // TODO: update board in cache
    return _sqflite.update(
      tableBoard,
      boardToDb(board),
      where: '$columnId = ?',
      whereArgs: [board.id],
    ).then((boardId) {
      board.id = null;
      return board;
    });
  }

  @override
  Future<EntityPortion<Thread>> historyThreads(EntityPage entityPage) {
    return _sqflite.query(
      tableThread,
      orderBy: '$columnThreadLastSeenDate desc',
      limit: 15,
      offset: entityPage.page,
    ).then((rawThreads) async {
      final result = <Thread>[];
      for (var rawThread in rawThreads) {
        final boardId = rawThread[columnThreadBoardId];
        final board = _boardsCache.isEmpty
            ? await _boardById(boardId)
            : _boardsCache.values.firstWhere((board) => board.id == boardId);
        result.add(
          threadFromDb(rawThread, board),
        );
      }
      return EntityPortion(
        result,
        result.isEmpty || result.length < 15,
      );
    });
  }

  Future<Board> _boardById(int boardId) {
    return _sqflite.query(
      tableBoard,
      where: '$columnId = ?',
      whereArgs: [boardId],
    ).then((rawBoard) => boardFromDb(rawBoard.first));
  }

  @override
  Future<Thread> threadFromHistory(Thread thread) {
    return _sqflite.query(
      tableThread,
      where: '$columnThreadUrl = ?',
      whereArgs: ['\'${thread.threadUrl}\''],
    ).then((rawThreadResult) async {
      if (rawThreadResult.isEmpty) {
        return null;
      }
      final rawThread = rawThreadResult.first;
      final boardId = rawThread[columnThreadBoardId];
      final board = _boardsCache.isEmpty
          ? await _boardById(boardId)
          : _boardsCache.values.firstWhere((board) => board.id == boardId);
      return threadFromDb(rawThread, board);
    });
  }

  @override
  Future<Thread> addToHistory(Thread thread) async {
    if (thread.isNew()) {
      return _sqflite.insert(
        tableThread,
        threadToDb(thread),
      ).then((threadId) {
        thread.id = threadId;
        return thread;
      });
    }
    return thread;
  }

  @override
  Future<Thread> removeFromHistory(Thread thread) {
    return _sqflite.delete(
      tableThread,
      where: '${thread.id}',
    ).then((value) => thread);
  }
}

const tableBoard = 'board';
const tableThread = 'thread';

const columnId = 'id';

const columnBoardName = 'name';
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
const columnThreadImageUrl = 'image_url';
const columnThreadImageWidth = 'image_width';
const columnThreadImageHeight = 'image_height';
const columnThreadThumbnailImageUrl = 'thumbnail_image_url';
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
      '$columnThreadImageUrl text,'
      '$columnThreadImageWidth int,'
      '$columnThreadImageHeight int,'
      '$columnThreadThumbnailImageUrl text,'
      '$columnThreadThumbnailImageWidth int,'
      '$columnThreadThumbnailImageHeight int,'
      '$columnThreadExt text,'
      '$columnThreadLastSeenDate text'
      ');';
}

Map<String, dynamic> boardToDb(Board board) {
  return {
    columnId: board.id,
    columnBoardName: board.board,
    columnBoardTitle: board.title,
    columnBoardIsFavorite: board.isFavorite ? 1 : 0,
  };
}

Board boardFromDb(Map<String, dynamic> data) {
  return Board(
    data[columnBoardName],
    data[columnBoardTitle],
    data[columnBoardIsFavorite] == 1,
    id: data[columnId],
  );
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
    columnThreadImageUrl: thread.imageUrl,
    columnThreadImageWidth: thread.imageWidth,
    columnThreadImageHeight: thread.imageHeight,
    columnThreadThumbnailImageUrl: thread.thumbnailImageUrl,
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
    data[columnThreadImageUrl],
    data[columnThreadImageWidth],
    data[columnThreadImageHeight],
    data[columnThreadThumbnailImageUrl],
    data[columnThreadThumbnailImageWidth],
    data[columnThreadThumbnailImageHeight],
    data[columnThreadExt],
    id: data[columnId],
  );
}
