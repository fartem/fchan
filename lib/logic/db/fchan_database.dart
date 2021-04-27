import '../../entities/board.dart';
import '../../entities/entity_page.dart';
import '../../entities/entity_portion.dart';
import '../../entities/thread.dart';

abstract class FChanDatabase {
  Future<FChanDatabase> init();

  Future<void> close();

  Future<List<Board>> favoriteBoards();

  Future<Board> addBoardToFavorites(Board board);

  Future<Board> removeBoardFromFavorites(Board board);

  Future<EntityPortion<Thread>> historyThreads(EntityPage entityPage);

  Future<Thread?> threadFromHistory(Thread thread);

  Future<bool> threadContainsInHistory(Thread thread);

  Future<Thread> addThreadToHistory(Thread thread);

  Future<Thread> updateThreadInHistory(Thread thread);

  Future<Thread> removeThreadFromHistory(Thread thread);

  Future<void> clearHistory();
}
