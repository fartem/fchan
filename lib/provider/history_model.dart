import 'package:fchan/entities/entity_page.dart';
import 'package:fchan/entities/entity_portion.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/logic/repository/repository.dart';
import 'package:flutter/material.dart';

class HistoryModel with ChangeNotifier {
  final FChanRepository _fChanRepository;

  HistoryModel(this._fChanRepository);

  Future<EntityPortion<Thread>> history(EntityPage portion) {
    return _fChanRepository.history(portion);
  }

  Future<Thread> addToHistory(Thread thread) {
    return _fChanRepository.addThreadToHistory(thread).then((historyThread) {
      notifyListeners();
      return historyThread;
    });
  }

  Future<Thread> removeFromHistory(Thread thread) {
    return _fChanRepository.removeThreadFromHistory(thread).then((removedThread) {
      notifyListeners();
      return removedThread;
    });
  }
}
