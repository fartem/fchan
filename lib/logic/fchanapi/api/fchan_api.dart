import '../../../entities/board.dart';
import '../../../entities/entity_page.dart';
import '../../../entities/entity_portion.dart';
import '../../../entities/post.dart';
import '../../../entities/thread.dart';

abstract class FChanApi {
  String baseUrlImage();

  Future<List<Board>> fetchBoards();

  Future<EntityPortion<Thread>> fetchCatalog({
    required Board board,
    required EntityPage entityPage,
  });

  Future<List<Post>> fetchPosts(Thread thread);

  String threadLink(Thread thread);
}
