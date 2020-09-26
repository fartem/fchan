import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/logic/db/database.dart';

class FakeDatabase extends Database {
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
  final List<Thread> _history = [];
  final List<Thread> _bookmarks = [];

  @override
  Future<List<Board>> favoriteBoards() async {
    return _favorites;
  }

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
  Future<List<Thread>> historyThreads() async {
    return _history;
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
  Future<List<Thread>> bookmarks() async {
    return _bookmarks;
  }

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
