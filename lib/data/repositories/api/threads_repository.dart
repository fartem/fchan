import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';

abstract class ThreadsRepository {
  Future<EntityPortion<Thread>> catalogForBoard(
    Board board,
    EntityPage entityPage,
  );

  String urlForThread(Thread thread);

  String urlForThreadsImage(Thread thread);

  String urlForThreadsImageThumbnail(Thread thread);

  String urlForPostsImage(Post post);

  String urlForPostsImageThumbnail(Post post);
}
