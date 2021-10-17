import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
import 'package:fchan/entities/thread.dart';

abstract class HistoryRepository {
  Future<EntityPortion<Thread>> history(EntityPage entityPage);

  Future<bool> threadContainsInHistory(Thread thread);

  Future<void> addThreadToHistory(Thread thread);

  Future<void> updateThreadInHistory(Thread thread);

  Future<void> removeThreadFromHistory(Thread thread);

  Future<void> clearHistory();
}
