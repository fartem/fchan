import 'package:flutter/material.dart';

import '../entities/entity_page.dart';
import '../entities/entity_portion.dart';
import '../entities/thread.dart';
import '../logic/repository/repository.dart';

class HistoryModel extends ChangeNotifier {
  final FChanRepository _fChanRepository;

  HistoryModel(this._fChanRepository);

  Future<EntityPortion> historyPage(EntityPage entityPage) => _fChanRepository.history(entityPage);

  Future<Thread> addToHistory(Thread thread) async {
    final threadAlreadyInHistory = await _fChanRepository.threadContainsInHistory(thread);
    thread.lastSeenDate = DateTime.now();
    if (!threadAlreadyInHistory) {
      await _fChanRepository.addThreadToHistory(thread);
    } else {
      await _fChanRepository.updateThreadInHistory(thread);
    }
    notifyListeners();
    return thread;
  }

  Future<Thread> removeFromHistory(Thread thread) async {
    await _fChanRepository.removeThreadFromHistory(thread);
    notifyListeners();
    return thread;
  }

  Future<void> clearHistory() async {
    await _fChanRepository.clearHistory();
    notifyListeners();
  }
}
