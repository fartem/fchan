import 'package:fchan/entities/thread.dart';
import 'package:flutter/material.dart';

class HistoryModel with ChangeNotifier {
  final List<Thread> history = [];

  void refreshHistory(List<Thread> history) {
    this.history.clear();
    this.history.addAll(history);
    notifyListeners();
  }

  void addToHistory(Thread thread) {
    history.add(thread);
    notifyListeners();
  }

  void removeFromHistory(Thread thread) {
    history.remove(thread);
    notifyListeners();
  }
}
