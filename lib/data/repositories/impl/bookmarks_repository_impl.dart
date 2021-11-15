import 'package:fchan/data/providers/local/api/local_data_provider.dart';
import 'package:fchan/data/repositories/api/bookmarks_repository.dart';
import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
import 'package:fchan/entities/thread.dart';

class BookmarksRepositoryImpl extends BookmarksRepository {
  final LocalDataProvider localDataProvider;

  BookmarksRepositoryImpl({required this.localDataProvider});

  @override
  Future<EntityPortion<Thread>> bookmarks(EntityPage entityPage) => localDataProvider.bookmarks(entityPage);

  @override
  Future<void> addThreadToBookmarks(Thread thread) => localDataProvider.addThreadToBookmarks(thread);

  @override
  Future<void> removeThreadFromBookmarks(Thread thread) => localDataProvider.removeThreadFromBookmarks(thread);
}
