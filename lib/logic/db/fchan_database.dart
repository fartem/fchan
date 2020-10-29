import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
import 'package:fchan/entities/thread.dart';

abstract class FChanDatabase {
  Future<FChanDatabase> init();
  Future<void> close();

  Future<EntityPortion<Board>> favoriteBoards(EntityPage entityPage);
  Future<Board> addToFavorites(Board board);
  Future<Board> removeFromFavorites(Board board);

  Future<EntityPortion<Thread>> historyThreads(EntityPage entityPage);
  Future<Thread> threadFromHistory(Thread thread);
  Future<Thread> addToHistory(Thread thread);
  Future<Thread> removeFromHistory(Thread thread);
}
