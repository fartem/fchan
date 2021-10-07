import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';

abstract class RemoteDataProvider {
  String baseUrlImage();

  Future<List<Board>> fetchBoards();

  Future<EntityPortion<Thread>> fetchCatalog({
    required Board board,
    required EntityPage entityPage,
  });

  Future<List<Post>> fetchPosts(Thread thread);

  String urlForThread(Thread thread);

  String urlForThreadsImage(Thread thread);

  String urlForThreadsImageThumbnail(Thread thread);

  String urlForPostsImage(Post post);

  String urlForPostsImageThumbnail(Post post);
}
