import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/thread.dart';

abstract class Database {
  Future<List<Board>> favoriteBoards();
  Future<Board> addToFavorites(Board board);
  Future<Board> removeFromFavorites(Board board);

  Future<List<Thread>> historyThreads();
  Future<Thread> addToHistory(Thread thread);
  Future<Thread> removeFromHistory(Thread thread);

  Future<List<Thread>> bookmarks();
  Future<Thread> addToBookmarks(Thread thread);
  Future<Thread> removeFromBookmarks(Thread thread);
}
