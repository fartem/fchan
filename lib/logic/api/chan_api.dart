import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';

abstract class ChanApi {
  Future<List<Board>> fetchBoards();
  Future<EntityPortion<Thread>> fetchCatalog(
      Board board,
      EntityPage entityPage,
  );
  Future<List<Post>> fetchPosts(Thread thread);
}
