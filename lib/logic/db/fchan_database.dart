import '../../entities/board.dart';
import '../../entities/entity_page.dart';
import '../../entities/entity_portion.dart';
import '../../entities/thread.dart';

abstract class FChanDatabase {
  Future<FChanDatabase> init();

  Future<void> close();

  Future<List<Board>> favoriteBoards();

  Future<Board> addToFavorites(Board board);

  Future<Board> removeFromFavorites(Board board);

  Future<EntityPortion<Thread>> historyThreads(EntityPage entityPage);

  Future<Thread> threadFromHistory(Thread thread);

  Future<bool> containsInHistory(Thread thread);

  Future<Thread> addToHistory(Thread thread);

  Future<Thread> removeFromHistory(Thread thread);
}
