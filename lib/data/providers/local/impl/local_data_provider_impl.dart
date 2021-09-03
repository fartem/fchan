import 'package:hive_flutter/hive_flutter.dart';

import '../../../../entities/board.dart';
import '../../../../entities/entity_page.dart';
import '../../../../entities/entity_portion.dart';
import '../../../../entities/thread.dart';
import '../api/local_data_provider.dart';

class LocalDataProviderImpl extends LocalDataProvider {
  late Box<Board> _favoriteBoards;
  late Box<Thread> _history;

  @override
  Future<LocalDataProvider> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BoardAdapter());
    Hive.registerAdapter(ThreadAdapter());
    _favoriteBoards = await Hive.openBox('favoriteBoards');
    _history = await Hive.openBox('history');
    return this;
  }

  @override
  Future<void> close() async {}

  @override
  Future<List<Board>> favoriteBoards() async => _favoriteBoards.values.toList();

  @override
  Future<void> addBoardToFavorites(Board board) async {
    board.isFavorite = true;
    _favoriteBoards.put(board.board, board);
  }

  @override
  Future<void> removeBoardFromFavorites(Board board) async {
    board.isFavorite = false;
    _favoriteBoards.delete(board.board);
  }

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
  Future<Thread?> threadFromHistory(Thread thread) async => _history.get('${thread.board}/{${thread.tim}');

  @override
  Future<bool> threadContainsInHistory(Thread thread) async => _history.containsKey(
        '${thread.board}/{${thread.tim}',
      );

  @override
  Future<void> addThreadToHistory(Thread thread) async {
    _history.put(
      '${thread.board}/{${thread.tim}',
      thread,
    );
  }

  @override
  Future<void> updateThreadInHistory(Thread thread) async {
    final key = '${thread.board}/{${thread.tim}';
    _history.delete(key);
    _history.put(key, thread);
  }

  @override
  Future<void> removeThreadFromHistory(Thread thread) => _history.delete(
        '${thread.board}/{${thread.tim}',
      );

  @override
  Future<void> clearHistory() => _history.clear();
}
