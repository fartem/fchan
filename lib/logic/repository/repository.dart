import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/logic/api/chan_api.dart';
import 'package:fchan/logic/db/fchan_database.dart';

class FChanRepository {
  final FChanDatabase _fChanDatabase;
  final ChanApi _chanApi;

  FChanRepository(this._fChanDatabase, this._chanApi);

  Future<void> init() async {
    await _fChanDatabase.init();
  }

  Future<void> dispose() async {
    await _fChanDatabase.close();
  }

  Future<List<Board>> boards() async {
    final favorites = await favoriteBoards();
    final boards = await _chanApi.fetchBoards();
    final result = <Board>[];
    boards.forEach((board) {
      final favorite = favorites.firstWhere(
            (favorite) => favorite == board,
            orElse: () => null,
      );
      if (favorite != null) {
        result.add(favorite);
      } else {
        result.add(board);
      }
    });
    return result;
  }

  Future<List<Board>> favoriteBoards() {
    return _fChanDatabase
        .favoriteBoards(Portion.all())
        .then((favoriteBoards) => favoriteBoards.portion);
  }

  Future<Board> addBoardToFavorites(Board board) {
    return _fChanDatabase.addToFavorites(board);
  }

  Future<Board> removeBoardFromFavorites(Board board) {
    return _fChanDatabase.removeFromFavorites(board);
  }

  Future<DataPage<Thread>> history(Portion portion) {
    return _fChanDatabase.historyThreads(portion);
  }

  Future<Thread> addThreadToHistory(Thread thread) {
    return _fChanDatabase.addToHistory(thread);
  }

  Future<Thread> removeThreadFromHistory(Thread thread) {
    return _fChanDatabase.removeFromBookmarks(thread);
  }

  Future<List<Thread>> catalogForBoard(Board board) async {
    final threads = await _chanApi.fetchCatalog(board);
    final result = <Thread>[];
    for (Thread thread in threads) {
      final historyThread = await _fChanDatabase.threadFromHistory(thread);
      if (historyThread != null) {
        result.add(historyThread);
      } else {
        result.add(thread);
      }
    }
    return result;
  }

  Future<List<Post>> postsForThread(Thread thread) {
    return _chanApi.fetchPosts(thread);
  }
}
