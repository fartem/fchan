import 'package:collection/collection.dart' show IterableExtension;
import 'package:fchan/logic/fchanapi/api/fchan_api.dart';

import '../../entities/board.dart';
import '../../entities/entity_page.dart';
import '../../entities/entity_portion.dart';
import '../../entities/post.dart';
import '../../entities/thread.dart';
import '../db/api/fchan_database.dart';

class FChanRepository {
  final FChanDatabase _fChanDatabase;
  final FChanApi _fChanApi;

  FChanRepository(this._fChanDatabase, this._fChanApi);

  Future<void> init() async => await _fChanDatabase.init();

  Future<void> dispose() async => await _fChanDatabase.close();

  Future<List<Board>> boards() async {
    final favorites = await favoriteBoards();
    final boards = await _fChanApi.fetchBoards();
    final result = <Board>[];
    boards.forEach((board) {
      final favorite = favorites.firstWhereOrNull(
        (favorite) => favorite == board,
      );
      if (favorite != null) {
        result.add(favorite);
      } else {
        result.add(board);
      }
    });
    return result;
  }

  Future<List<Board>> favoriteBoards() => _fChanDatabase.favoriteBoards();

  Future<Board> addBoardToFavorites(Board board) => _fChanDatabase.addBoardToFavorites(board);

  Future<Board> removeBoardFromFavorites(Board board) => _fChanDatabase.removeBoardFromFavorites(board);

  Future<EntityPortion<Thread>> history(EntityPage entityPage) => _fChanDatabase.historyThreads(entityPage);

  Future<bool> threadContainsInHistory(Thread thread) => _fChanDatabase.threadContainsInHistory(thread);

  Future<Thread> addThreadToHistory(Thread thread) => _fChanDatabase.addThreadToHistory(thread);

  Future<Thread> updateThreadInHistory(Thread thread) => _fChanDatabase.updateThreadInHistory(thread);

  Future<Thread> removeThreadFromHistory(Thread thread) => _fChanDatabase.removeThreadFromHistory(thread);

  Future<void> clearHistory() => _fChanDatabase.clearHistory();

  Future<EntityPortion<Thread>> catalogForBoard(Board board, EntityPage entityPage) async {
    final portion = await _fChanApi.fetchCatalog(board, entityPage);
    for (var i = 0; i < portion.entities.length; i++) {
      final historyThread = await _fChanDatabase.threadFromHistory(portion.entities[i]);
      if (historyThread != null) {
        portion.entities[i] = historyThread;
      }
    }
    return portion;
  }

  Future<List<Post>> postsForThread(Thread thread) => _fChanApi.fetchPosts(thread);

  String threadLink(Thread thread) => _fChanApi.threadLink(thread);
}
