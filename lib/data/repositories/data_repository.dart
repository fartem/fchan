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

  DataRepository({
    required this.localDataProvider,
    required this.remoteDataProvider,
  });

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

  Future<List<Board>> favoriteBoards() => localDataProvider.favoriteBoards();

  Future<void> addBoardToFavorites(Board board) => localDataProvider.addBoardToFavorites(board);

  Future<void> removeBoardFromFavorites(Board board) => localDataProvider.removeBoardFromFavorites(board);

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

  String urlForThread(Thread thread) => remoteDataProvider.urlForThread(thread);

  String urlForThreadsImage(Thread thread) => remoteDataProvider.urlForThreadsImage(thread);

  String urlForThreadsImageThumbnail(Thread thread) => remoteDataProvider.urlForThreadsImageThumbnail(thread);

  String urlForPostsImage(Post post) => remoteDataProvider.urlForPostsImage(post);

  String urlForPostsImageThumbnail(Post post) => remoteDataProvider.urlForPostsImageThumbnail(post);
}
