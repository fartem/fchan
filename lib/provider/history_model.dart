import 'package:fchan/entities/thread.dart';
import 'package:fchan/logic/db/fchan_database.dart';
import 'package:fchan/logic/repository/repository.dart';
import 'package:flutter/material.dart';

class HistoryModel with ChangeNotifier {
  final FChanRepository _fChanRepository;

  HistoryModel(this._fChanRepository);

  Future<DataPage<Thread>> history(Portion portion) {
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
