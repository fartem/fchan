import 'package:fchan/data/providers/local/api/local_data_provider.dart';
import 'package:fchan/data/repositories/api/history_repository.dart';
import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
import 'package:fchan/entities/thread.dart';

class HistoryRepositoryImpl extends HistoryRepository {
  final LocalDataProvider localDataProvider;

  HistoryRepositoryImpl({required this.localDataProvider});

  @override
  Future<EntityPortion<Thread>> history(EntityPage entityPage) => localDataProvider.historyThreads(entityPage);

  @override
  Future<void> addThreadToHistory(Thread thread) => localDataProvider.addThreadToHistory(thread);

  @override
  Future<void> removeThreadFromHistory(Thread thread) => localDataProvider.removeThreadFromHistory(thread);

  @override
  Future<bool> threadContainsInHistory(Thread thread) => localDataProvider.threadContainsInHistory(thread);

  @override
  Future<void> updateThreadInHistory(Thread thread) => localDataProvider.updateThreadInHistory(thread);

  @override
  Future<void> clearHistory() => localDataProvider.clearHistory();
}
