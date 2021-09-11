import '../../../../entities/board.dart';
import '../../../../entities/entity_page.dart';
import '../../../../entities/entity_portion.dart';
import '../../../../entities/thread.dart';

abstract class LocalDataProvider {
  Future<LocalDataProvider> init();

  Future<void> close();

  Future<List<Board>> favorites();

  Future<void> addBoardToFavorites(Board board);

  Future<void> removeBoardFromFavorites(Board board);

  Future<EntityPortion<Thread>> historyThreads(EntityPage entityPage);

  Future<bool> threadContainsInHistory(Thread thread);

  Future<void> addThreadToHistory(Thread thread);

  Future<void> updateThreadInHistory(Thread thread);

  Future<void> removeThreadFromHistory(Thread thread);

  Future<EntityPortion<Thread>> bookmarks(EntityPage entityPage);

  Future<bool> threadContainsInBookmarks(Thread thread);

  Future<void> addThreadToBookmarks(Thread thread);

  Future<void> removeThreadFromBookmarks(Thread thread);

  Future<void> clearHistory();
}
