import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
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
        .favoriteBoards(EntityPage.all())
        .then((favoriteBoards) => favoriteBoards.entities);
  }

  Future<Board> addBoardToFavorites(Board board) {
    return _fChanDatabase.addToFavorites(board);
  }

  Future<Board> removeBoardFromFavorites(Board board) {
    return _fChanDatabase.removeFromFavorites(board);
  }

  Future<EntityPortion<Thread>> history(EntityPage entityPage) {
    return _fChanDatabase.historyThreads(entityPage);
  }

  Future<Thread> addThreadToHistory(Thread thread) {
    return _fChanDatabase.addToHistory(thread);
  }

  Future<Thread> removeThreadFromHistory(Thread thread) {
    return _fChanDatabase.removeFromHistory(thread);
  }

  Future<EntityPortion<Thread>> catalogForBoard(
      Board board,
      EntityPage entityPage
  ) async {
    final portion = await _chanApi.fetchCatalog(board, entityPage);
    for (var i = 0; i < portion.entities.length; i++) {
      final historyThread = await _fChanDatabase.threadFromHistory(portion.entities[i]);
      if (historyThread != null) {
        portion.entities[i] = historyThread;
      }
    }
    return portion;
  }

  Future<List<Post>> postsForThread(Thread thread) {
    return _chanApi.fetchPosts(thread);
  }
}
