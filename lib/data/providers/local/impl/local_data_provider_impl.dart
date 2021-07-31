import 'package:sqflite/sqflite.dart';

import '../../../../entities/board.dart';
import '../../../../entities/entity_page.dart';
import '../../../../entities/entity_portion.dart';
import '../../../../entities/thread.dart';
import '../api/local_data_provider.dart';

const String _dbName = 'fchan.db';

const int _version1 = 1;

const int _currentVersion = _version1;

class LocalDataProviderImpl extends LocalDataProvider {
  static final _favoriteBoardsCache = <String, Board>{};

  late Database _database;

  @override
  Future<LocalDataProvider> init() async {
    _database = await openDatabase(
      _dbName,
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
      final rawBoards = await _database.query(
        tableBoard,
        where: '$columnBoardIsFavorite = ?',
        whereArgs: [1],
      );
      final boards = rawBoards.map((rawBoard) => Board.fromJson(rawBoard)).toList();
      boards.forEach((board) => _favoriteBoardsCache[board.board] = board);
    }
    return _favoriteBoardsCache.values.toList();
  }

  @override
  Future<Board> addBoardToFavorites(Board board) async {
    board.isFavorite = true;
    if (board.isNew()) {
      final boardId = await _database.insert(
        tableBoard,
        board.toJson(),
      );
      board.id = boardId;
      _favoriteBoardsCache[board.board] = board;
      return board;
    } else {
      await _database.update(
        tableBoard,
        board.toJson(),
      );
      return board;
    }
  }

  @override
  Future<Board> removeBoardFromFavorites(Board board) async {
    board.isFavorite = false;
    _favoriteBoardsCache.remove(board.board);
    await _database.delete(
      tableBoard,
      where: '$columnId = ?',
      whereArgs: [board.id],
    );
    board.id = null;
    return board;
  }

  @override
  Future<EntityPortion<Thread>> historyThreads(EntityPage entityPage) async {
    final rawThreads = await _database.query(
      tableThread,
      orderBy: '$columnThreadLastSeenDate desc',
      limit: 15,
      offset: entityPage.page == 1 ? 0 : entityPage.page * 15,
    );
    final result = <Thread>[];
    for (var rawThread in rawThreads) {
      final boardId = rawThread[columnThreadBoardId];
      final board = _favoriteBoardsCache.isEmpty
          ? await _boardById(boardId as int?)
          : _favoriteBoardsCache.values.firstWhere((board) => board.id == boardId);
      result.add(Thread.fromJson(board, rawThread));
    }
    return EntityPortion(
      entities: result,
      isLastPage: result.isEmpty || result.length < 15,
    );
  }

  Future<Board> _boardById(int? boardId) async {
    final rawBoard = await _database.query(
      tableBoard,
      where: '$columnId = ?',
      whereArgs: [boardId],
    );
    return Board.fromJson(rawBoard.first);
  }

  @override
  Future<Thread?> threadFromHistory(Thread thread) async {
    final rawThreadResult = await _database.query(
      tableThread,
      where: '$columnThreadNo = ?',
      whereArgs: [thread.no],
    );
    if (rawThreadResult.isEmpty) {
      return null;
    }
    final rawThread = rawThreadResult.first;
    final boardId = rawThread[columnThreadBoardId];
    final board = _favoriteBoardsCache.isEmpty
        ? await _boardById(boardId as int?)
        : _favoriteBoardsCache.values.firstWhere((board) => board.id == boardId);
    return Thread.fromJson(board, rawThread);
  }

  @override
  Future<bool> threadContainsInHistory(Thread thread) async {
    final query = await _database.query(
      tableThread,
      where: '$columnThreadNo = ?',
      whereArgs: [thread.no],
    );
    return query.isNotEmpty;
  }

  @override
  Future<Thread> addThreadToHistory(Thread thread) async {
    if (thread.isNew()) {
      final threadId = await _database.insert(
        tableThread,
        thread.toJson(),
      );
      thread.id = threadId;
      return thread;
    }
    return thread;
  }

  @override
  Future<Thread> updateThreadInHistory(Thread thread) async {
    await _database.update(
      tableThread,
      thread.toJson(),
      where: '$columnId = ?',
      whereArgs: [thread.id],
    );
    return thread;
  }

  @override
  Future<Thread> removeThreadFromHistory(Thread thread) async {
    await _database.delete(
      tableThread,
      where: '$columnId = ?',
      whereArgs: [thread.id],
    );
    return thread;
  }

  @override
  Future<void> clearHistory() async => await _database.rawQuery('delete from $tableThread');
}

const tableBoard = 'board';
const tableThread = 'thread';

const columnId = 'id';

const columnBoardName = 'board';
const columnBoardTitle = 'title';
const columnBoardIsFavorite = 'is_favorite';

const columnThreadBoardId = 'board_id';
const columnThreadNo = 'no';
const columnThreadSub = 'sub';
const columnThreadCom = 'com';
const columnThreadTim = 'tim';
const columnThreadTimeFromPublish = 'time';
const columnThreadReplies = 'replies';
const columnThreadImages = 'images';
const columnThreadImageWidth = 'w';
const columnThreadImageHeight = 'h';
const columnThreadThumbnailImageWidth = 'tn_w';
const columnThreadThumbnailImageHeight = 'tn_h';
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
      '$columnThreadNo int,'
      '$columnThreadSub text,'
      '$columnThreadTim int,'
      '$columnThreadCom text,'
      '$columnThreadTimeFromPublish int,'
      '$columnThreadReplies int,'
      '$columnThreadImages int,'
      '$columnThreadImageWidth int,'
      '$columnThreadImageHeight int,'
      '$columnThreadThumbnailImageWidth int,'
      '$columnThreadThumbnailImageHeight int,'
      '$columnThreadExt text,'
      '$columnThreadLastSeenDate text'
      ');';
}
