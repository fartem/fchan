import 'package:collection/collection.dart' show IterableExtension;

import '../../entities/board.dart';
import '../../entities/entity_page.dart';
import '../../entities/entity_portion.dart';
import '../../entities/post.dart';
import '../../entities/thread.dart';
import '../providers/local/api/local_data_provider.dart';
import '../providers/remote/api/remote_data_provider.dart';

class DataRepository {
  final LocalDataProvider localDataProvider;
  final RemoteDataProvider remoteDataProvider;

  final _boardsSessionCache = <Board>[];
  final _favoritesBoardsCache = <int, Board>{};

  DataRepository({
    required this.localDataProvider,
    required this.remoteDataProvider,
  });

  String baseUrlImage() => remoteDataProvider.baseUrlImage();

  Future<void> init() async => await localDataProvider.init();

  Future<void> dispose() async => await localDataProvider.close();

  Future<List<Board>> boards() async {
    if (_boardsSessionCache.isEmpty) {
      final favorites = await favoriteBoards();
      final result = <Board>[];
      final boards = await remoteDataProvider.fetchBoards();
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
      _boardsSessionCache.addAll(result);
    }
    return _boardsSessionCache;
  }

  Future<List<Board>> favoriteBoards() async {
    if (_favoritesBoardsCache.isEmpty) {
      final favoritesBoards = await localDataProvider.favoriteBoards();
      favoritesBoards.forEach((board) => _favoritesBoardsCache[board.id!] = board);
    }
    return _favoritesBoardsCache.values.sorted((a, b) => a.board.compareTo(b.board));
  }

  Future<void> addBoardToFavorites(Board board) async {
    await localDataProvider.addBoardToFavorites(board);
    _favoritesBoardsCache[board.id!] = board;
  }

  Future<void> removeBoardFromFavorites(Board board) async {
    _favoritesBoardsCache.remove(board.id);
    localDataProvider.removeBoardFromFavorites(board);
  }

  Future<EntityPortion<Thread>> history(EntityPage entityPage) => localDataProvider.historyThreads(entityPage);

  Future<bool> threadContainsInHistory(Thread thread) => localDataProvider.threadContainsInHistory(thread);

  Future<void> addThreadToHistory(Thread thread) => localDataProvider.addThreadToHistory(thread);

  Future<void> updateThreadInHistory(Thread thread) => localDataProvider.updateThreadInHistory(thread);

  Future<void> removeThreadFromHistory(Thread thread) => localDataProvider.removeThreadFromHistory(thread);

  Future<void> clearHistory() => localDataProvider.clearHistory();

  Future<EntityPortion<Thread>> catalogForBoard(
    Board board,
    EntityPage entityPage,
  ) async {
    final portion = await remoteDataProvider.fetchCatalog(
      board: board,
      entityPage: entityPage,
    );
    for (var i = 0; i < portion.entities.length; i++) {
      final historyThread = await localDataProvider.threadFromHistory(portion.entities[i]);
      if (historyThread != null) {
        portion.entities[i] = historyThread;
      }
    }
    return portion;
  }

  Future<List<Post>> postsForThread(Thread thread) => remoteDataProvider.fetchPosts(thread);
}
