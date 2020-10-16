import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/logic/db/fchan_database.dart';

class FakeDatabase extends FChanDatabase {
  final List<Board> _favorites = [
    Board(
      'g',
      'Technology',
      true,
    ),
    Board(
      'b',
      'Random',
      true,
    ),
    Board(
      'wg',
      'Wallpapers/General',
      true,
    ),
  ];
  final Set<Thread> _history = Set();
  final List<Thread> _bookmarks = [];

  @override
  Future<FChanDatabase> init() async {
    return this;
  }

  @override
  Future<void> close() async {

  }

  @override
  Future<DataPage<Board>> favoriteBoards(Portion portion) async => DataPage(_favorites, true);

  @override
  Future<Board> addToFavorites(Board board) async {
    _favorites.add(board);
    return board;
  }

  @override
  Future<Board> removeFromFavorites(Board board) async {
    _favorites.remove(board);
    return board;
  }

  @override
  Future<DataPage<Thread>> historyThreads(Portion portion) async => DataPage(_history.toList(), true);

  @override
  Future<Thread> threadFromHistory(Thread thread) {
    return null;
  }

  @override
  Future<Thread> addToHistory(Thread thread) async {
    _history.add(thread);
    return thread;
  }

  @override
  Future<Thread> removeFromHistory(Thread thread) async {
    _history.remove(thread);
    return thread;
  }

  @override
  Future<DataPage<Thread>> bookmarks(Portion portion) async => DataPage(_bookmarks, true);

  @override
  Future<Thread> addToBookmarks(Thread thread) async {
    _bookmarks.add(thread);
    return thread;
  }

  @override
  Future<Thread> removeFromBookmarks(Thread thread) async {
    _bookmarks.remove(thread);
    return thread;
  }
}
