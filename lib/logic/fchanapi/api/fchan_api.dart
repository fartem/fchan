import '../../../entities/board.dart';
import '../../../entities/entity_page.dart';
import '../../../entities/entity_portion.dart';
import '../../../entities/post.dart';
import '../../../entities/thread.dart';

abstract class FChanApi {
  Future<List<Board>> fetchBoards();

  Future<EntityPortion<Thread>> fetchCatalog(
    Board board,
    EntityPage entityPage,
  );

  Future<List<Post>> fetchPosts(Thread thread);

  String threadLink(Thread thread);
}
