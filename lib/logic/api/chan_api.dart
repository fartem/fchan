import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';

abstract class ChanApi {
  Future<List<Board>> fetchBoards();
  Future<List<Thread>> fetchCatalog(Board board);
  Future<List<Post>> fetchPosts(Thread thread);
}
