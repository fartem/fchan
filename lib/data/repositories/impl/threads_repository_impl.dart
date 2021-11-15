import 'package:fchan/data/providers/remote/api/remote_data_provider.dart';
import 'package:fchan/data/repositories/api/threads_repository.dart';
import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';

class ThreadsRepositoryImpl extends ThreadsRepository {
  final RemoteDataProvider remoteDataProvider;

  ThreadsRepositoryImpl({required this.remoteDataProvider});

  @override
  Future<EntityPortion<Thread>> catalogForBoard(
    Board board,
    EntityPage entityPage,
  ) =>
      remoteDataProvider.fetchCatalog(
        board: board,
        entityPage: entityPage,
      );

  @override
  String urlForThread(Thread thread) => remoteDataProvider.urlForThread(thread);

  @override
  String urlForThreadsImage(Thread thread) => remoteDataProvider.urlForThreadsImage(thread);

  @override
  String urlForThreadsImageThumbnail(Thread thread) => remoteDataProvider.urlForThreadsImageThumbnail(thread);

  @override
  String urlForPostsImage(Post post) => remoteDataProvider.urlForPostsImage(post);

  @override
  String urlForPostsImageThumbnail(Post post) => remoteDataProvider.urlForPostsImageThumbnail(post);
}
