import 'package:collection/collection.dart' show IterableExtension;
import 'package:fchan/data/providers/local/api/local_data_provider.dart';
import 'package:fchan/data/providers/remote/api/remote_data_provider.dart';
import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';

class DataRepository {
  final LocalDataProvider localDataProvider;
  final RemoteDataProvider remoteDataProvider;

  final _boardsSessionCache = <Board>[];

  DataRepository({
    required this.localDataProvider,
    required this.remoteDataProvider,
  });

  Future<void> init() => localDataProvider.init();

  Future<void> dispose() => localDataProvider.close();

  Future<List<Board>> boards() async {
    if (_boardsSessionCache.isEmpty) {
      final favoriteBoards = await favorites();
      final result = <Board>[];
      final boards = await remoteDataProvider.fetchBoards();
      boards.forEach((board) {
        final favorite = favoriteBoards.firstWhereOrNull(
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

  Future<List<Board>> favorites() => localDataProvider.favorites();

  Future<void> addBoardToFavorites(Board board) => localDataProvider.addBoardToFavorites(board);

  Future<void> removeBoardFromFavorites(Board board) => localDataProvider.removeBoardFromFavorites(board);

  Future<EntityPortion<Thread>> history(EntityPage entityPage) => localDataProvider.historyThreads(entityPage);

  Future<bool> threadContainsInHistory(Thread thread) => localDataProvider.threadContainsInHistory(thread);

  Future<void> addThreadToHistory(Thread thread) => localDataProvider.addThreadToHistory(thread);

  Future<void> updateThreadInHistory(Thread thread) => localDataProvider.updateThreadInHistory(thread);

  Future<void> removeThreadFromHistory(Thread thread) => localDataProvider.removeThreadFromHistory(thread);

  Future<void> clearHistory() => localDataProvider.clearHistory();

  Future<EntityPortion<Thread>> bookmarks(EntityPage entityPage) => localDataProvider.bookmarks(entityPage);

  Future<void> addThreadToBookmarks(Thread thread) => localDataProvider.addThreadToBookmarks(thread);

  Future<void> removeThreadFromBookmarks(Thread thread) => localDataProvider.removeThreadFromBookmarks(thread);

  Future<EntityPortion<Thread>> catalogForBoard(
    Board board,
    EntityPage entityPage,
  ) =>
      remoteDataProvider.fetchCatalog(
        board: board,
        entityPage: entityPage,
      );

  Future<List<Post>> postsForThread(Thread thread) => remoteDataProvider.fetchPosts(thread);

  String urlForThread(Thread thread) => remoteDataProvider.urlForThread(thread);

  String urlForThreadsImage(Thread thread) => remoteDataProvider.urlForThreadsImage(thread);

  String urlForThreadsImageThumbnail(Thread thread) => remoteDataProvider.urlForThreadsImageThumbnail(thread);

  String urlForPostsImage(Post post) => remoteDataProvider.urlForPostsImage(post);

  String urlForPostsImageThumbnail(Post post) => remoteDataProvider.urlForPostsImageThumbnail(post);
}
