import '../../../../entities/board.dart';
import '../../../../entities/entity_page.dart';
import '../../../../entities/entity_portion.dart';
import '../../../../entities/thread.dart';

abstract class LocalDataProvider {
  Future<LocalDataProvider> init();

  Future<void> close();

  Future<List<Board>> favoriteBoards();

  Future<void> addBoardToFavorites(Board board);

  Future<void> removeBoardFromFavorites(Board board);

  Future<EntityPortion<Thread>> historyThreads(EntityPage entityPage);

  Future<Thread?> threadFromHistory(Thread thread);

  Future<bool> threadContainsInHistory(Thread thread);

  Future<void> addThreadToHistory(Thread thread);

  Future<void> updateThreadInHistory(Thread thread);

  Future<void> removeThreadFromHistory(Thread thread);

  Future<void> clearHistory();
}
