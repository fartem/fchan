import 'package:fchan/data/providers/local/api/local_data_provider.dart';
import 'package:fchan/data/providers/local/impl/adapters/duration_adapter.dart';
import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
import 'package:fchan/entities/thread.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataProviderImpl extends LocalDataProvider {
  late Box<Board> _favorites;
  late Box<Thread> _history;
  late Box<Thread> _bookmarks;

  @override
  Future<LocalDataProvider> init() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(BoardAdapter())
      ..registerAdapter(ThreadAdapter())
      ..registerAdapter(DurationAdapter());
    _favorites = await Hive.openBox('favorites');
    _history = await Hive.openBox('history');
    _bookmarks = await Hive.openBox('bookmarks');
    return this;
  }

  @override
  Future<void> close() async {
    await _favorites.close();
    await _history.close();
    await _bookmarks.close();
  }

  @override
  Future<List<Board>> favorites() async => _favorites.values.toList();

  @override
  Future<void> addBoardToFavorites(Board board) => _favorites.put(board.board, board);

  @override
  Future<void> removeBoardFromFavorites(Board board) => _favorites.delete(board.board);

  @override
  Future<EntityPortion<Thread>> historyThreads(EntityPage entityPage) async {
    var last = entityPage.page * entityPage.pageSize;
    if (last > _history.length) {
      last = _history.length;
    }
    var start = last - entityPage.pageSize;
    if (start < 0) {
      start = 0;
    }
    return EntityPortion(
      entities: _history.values.toList().sublist(
            start,
            last,
          ),
      isLastPage: _history.length == last,
    );
  }

  @override
  Future<bool> threadContainsInHistory(Thread thread) async => _history.containsKey(
        '${thread.board}/${thread.tim}',
      );

  @override
  Future<void> addThreadToHistory(Thread thread) async {
    await _history.put(
      '${thread.board}/${thread.tim}',
      thread,
    );
  }

  @override
  Future<void> updateThreadInHistory(Thread thread) async {
    final key = '${thread.board}/${thread.tim}';
    await _history.delete(key);
    await _history.put(key, thread);
  }

  @override
  Future<void> removeThreadFromHistory(Thread thread) => _history.delete(
        '${thread.board}/${thread.tim}',
      );

  @override
  Future<void> clearHistory() => _history.clear();

  @override
  Future<EntityPortion<Thread>> bookmarks(EntityPage entityPage) async {
    var last = entityPage.page * entityPage.pageSize;
    if (last > _bookmarks.length) {
      last = _bookmarks.length;
    }
    var start = last - entityPage.pageSize;
    if (start < 0) {
      start = 0;
    }
    return EntityPortion(
      entities: _bookmarks.values.toList().sublist(
            start,
            last,
          ),
      isLastPage: _bookmarks.length == last,
    );
  }

  @override
  Future<bool> threadContainsInBookmarks(Thread thread) async => _bookmarks.containsKey(
        '${thread.board}/${thread.tim}',
      );

  @override
  Future<void> addThreadToBookmarks(Thread thread) => _bookmarks.put(
        '${thread.board}/${thread.tim}',
        thread,
      );

  @override
  Future<void> removeThreadFromBookmarks(Thread thread) async => _bookmarks.delete(
        '${thread.board}/${thread.tim}',
      );
}
