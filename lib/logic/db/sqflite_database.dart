import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/logic/db/fchan_database.dart';
import 'package:sqflite/sqflite.dart';

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
          db.execute(_SQFLiteSchema.createBoardTable()),
          db.execute(_SQFLiteSchema.createThreadTable()),
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
      _SQFLiteSchema.tableBoard,
      where: '${_SQFLiteSchema.columnBoardIsFavorite} = 1',
    ).then((rawBoards) {
      final List<Board> boards = rawBoards.map((rawBoard) => _SQFLiteSchema.boardFromDb(rawBoard)).toList();
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
        _SQFLiteSchema.tableBoard,
        _SQFLiteSchema.boardToDb(board),
      ).then((boardId) {
        board.id = boardId;
        _boardsCache[board.board] = board;
        return board;
      });
    } else {
      return _sqflite.update(
        _SQFLiteSchema.tableBoard,
        _SQFLiteSchema.boardToDb(board),
      ).then((boardId) => board);
    }
  }

  @override
  Future<Board> removeFromFavorites(Board board) {
    board.isFavorite = false;
    // TODO: update board in cache
    return _sqflite.update(
      _SQFLiteSchema.tableBoard,
      _SQFLiteSchema.boardToDb(board),
      where: '${_SQFLiteSchema.columnId} = ${board.id}',
    ).then((boardId) => board);
  }

  @override
  Future<EntityPortion<Thread>> historyThreads(EntityPage entityPage) {
    return _sqflite.query(
      _SQFLiteSchema.tableThread,
      orderBy: '${_SQFLiteSchema.columnThreadLastSeenDate} desc',
      limit: 15,
      offset: entityPage.page,
    ).then((rawThreads) async {
      final result = <Thread>[];
      for (var rawThread in rawThreads) {
        final boardId = rawThread[_SQFLiteSchema.columnThreadBoardId];
        final board = _boardsCache.isEmpty
            ? await _boardById(boardId)
            : _boardsCache.values.firstWhere((board) => board.id == boardId);
        result.add(
          _SQFLiteSchema.threadFromDb(rawThread, board),
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
      _SQFLiteSchema.tableBoard,
      where: '${_SQFLiteSchema.columnId} = $boardId',
    ).then((rawBoard) => _SQFLiteSchema.boardFromDb(rawBoard.first));
  }

  @override
  Future<Thread> threadFromHistory(Thread thread) {
    return _sqflite.query(
      _SQFLiteSchema.tableThread,
      where: '${_SQFLiteSchema.columnThreadUrl} = \'${thread.threadUrl}\'',
    ).then((rawThreadResult) async {
      if (rawThreadResult.isEmpty) {
        return null;
      }
      final rawThread = rawThreadResult.first;
      final boardId = rawThread[_SQFLiteSchema.columnThreadBoardId];
      final board = _boardsCache.isEmpty
          ? await _boardById(boardId)
          : _boardsCache.values.firstWhere((board) => board.id == boardId);
      return _SQFLiteSchema.threadFromDb(rawThread, board);
    });
  }

  @override
  Future<Thread> addToHistory(Thread thread) async {
    if (thread.isNew()) {
      return _sqflite.insert(
        _SQFLiteSchema.tableThread,
        _SQFLiteSchema.threadToDb(thread),
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
      _SQFLiteSchema.tableThread,
      where: '${thread.id}',
    ).then((value) => thread);
  }
}

class _SQFLiteSchema {
  static final tableBoard = 'board';
  static final tableThread = 'thread';

  static final columnId = 'id';

  static final columnBoardName = 'name';
  static final columnBoardTitle = 'title';
  static final columnBoardIsFavorite = 'is_favorite';

  static final columnThreadBoardId = 'board_id';
  static final columnThreadUrl = 'thread_url';
  static final columnThreadNo = 'no';
  static final columnThreadSub = 'sub';
  static final columnThreadCom = 'com';
  static final columnThreadTimeFromPublish = 'time_from_publish';
  static final columnThreadReplies = 'replies';
  static final columnThreadImages = 'images';
  static final columnThreadImageUrl = 'image_url';
  static final columnThreadImageWidth = 'image_width';
  static final columnThreadImageHeight = 'image_height';
  static final columnThreadThumbnailImageUrl = 'thumbnail_image_url';
  static final columnThreadThumbnailImageWidth = 'thumbnail_image_width';
  static final columnThreadThumbnailImageHeight = 'thumbnail_image_height';
  static final columnThreadExt = 'ext';
  static final columnThreadLastSeenDate = 'last_seen_date';

  static String createBoardTable() {
    return 'create table $tableBoard('
        '$columnId integer primary key autoincrement,'
        '$columnBoardName text,'
        '$columnBoardTitle text,'
        '$columnBoardIsFavorite int'
        ');';
  }

  static String createThreadTable() {
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

  static Map<String, dynamic> boardToDb(Board board) {
    return {
      columnId: board.id,
      columnBoardName: board.board,
      columnBoardTitle: board.title,
      columnBoardIsFavorite: board.isFavorite ? 1 : 0,
    };
  }

  static Board boardFromDb(Map<String, dynamic> data) {
    return Board(
      data[columnBoardName],
      data[columnBoardTitle],
      data[columnBoardIsFavorite] == 1,
      id: data[columnId],
    );
  }

  static Map<String, dynamic> threadToDb(Thread thread) {
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

  static Thread threadFromDb(Map<String, dynamic> data, Board board) {
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
}
