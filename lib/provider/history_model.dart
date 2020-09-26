import 'package:fchan/entities/thread.dart';
import 'package:fchan/logic/db/database.dart';
import 'package:flutter/material.dart';

class HistoryModel with ChangeNotifier {
  final Database _database;

  HistoryModel(this._database);

  Future<List<Thread>> historyThreads() => _database.historyThreads();

  Future<Thread> addToHistory(Thread thread) {
    return _database.addToHistory(thread).then((value) {
      notifyListeners();
      return value;
    });
  }

  Future<Thread> removeFromHistory(Thread thread) {
    return _database.removeFromHistory(thread).then((value) {
      notifyListeners();
      return value;
    });
  }
}
