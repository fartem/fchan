import '../../entities/board.dart';
import '../../entities/entity_page.dart';
import '../../entities/entity_portion.dart';
import '../../entities/post.dart';
import '../../entities/thread.dart';
import '../api/chan_api.dart';
import '../db/fchan_database.dart';

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

  Future<List<Board>> favoriteBoards() =>
      _fChanDatabase.favoriteBoards(EntityPage.all()).then((favoriteBoards) => favoriteBoards.entities);

  Future<Board> addBoardToFavorites(Board board) => _fChanDatabase.addToFavorites(board);

  Future<Board> removeBoardFromFavorites(Board board) => _fChanDatabase.removeFromFavorites(board);

  Future<EntityPortion<Thread>> history(EntityPage entityPage) => _fChanDatabase.historyThreads(entityPage);

  Future<Thread> addThreadToHistory(Thread thread) => _fChanDatabase.addToHistory(thread);

  Future<Thread> removeThreadFromHistory(Thread thread) => _fChanDatabase.removeFromHistory(thread);

  Future<EntityPortion<Thread>> catalogForBoard(Board board, EntityPage entityPage) async {
    final portion = await _chanApi.fetchCatalog(board, entityPage);
    for (var i = 0; i < portion.entities.length; i++) {
      final historyThread = await _fChanDatabase.threadFromHistory(portion.entities[i]);
      if (historyThread != null) {
        portion.entities[i] = historyThread;
      }
    }
    return portion;
  }

  Future<List<Post>> postsForThread(Thread thread) => _chanApi.fetchPosts(thread);
}
