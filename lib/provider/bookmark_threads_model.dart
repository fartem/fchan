import 'package:fchan/entities/thread.dart';
import 'package:flutter/material.dart';

class BookmarkThreadsModel with ChangeNotifier {
  final List<Thread> bookmarks = [];

  void refreshBookmarkThreads(List<Thread> bookmarks) {
    this.bookmarks.clear();
    this.bookmarks.addAll(bookmarks);
    notifyListeners();
  }

  void addThreadToBookmarks(Thread thread) {
    bookmarks.add(thread);
    notifyListeners();
  }

  void removeThreadFromBookmarks(Thread thread) {
    bookmarks.remove(thread);
    notifyListeners();
  }
}
