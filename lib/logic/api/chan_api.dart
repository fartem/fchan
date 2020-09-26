import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';

abstract class ChanApi {
  Future<List<Board>> fetchBoards();
  Future<List<Thread>> fetchCatalogPage(Board board);
  Future<List<Post>> fetchPosts(Board board, Thread thread);
}
