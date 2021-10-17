import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
import 'package:fchan/entities/thread.dart';

abstract class BookmarksRepository {
  Future<EntityPortion<Thread>> bookmarks(EntityPage entityPage);

  Future<void> addThreadToBookmarks(Thread thread);

  Future<void> removeThreadFromBookmarks(Thread thread);
}
