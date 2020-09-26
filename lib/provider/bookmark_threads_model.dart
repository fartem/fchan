import 'package:fchan/entities/thread.dart';
import 'package:fchan/logic/db/database.dart';
import 'package:flutter/material.dart';

class BookmarkThreadsModel with ChangeNotifier {
  final Database _database;

  BookmarkThreadsModel(this._database);

  Future<List<Thread>> bookmarks() => _database.bookmarks();

  Future<Thread> addThreadToBookmarks(Thread thread) {
    return _database.addToBookmarks(thread).then((value) {
      notifyListeners();
      return value;
    });
  }

  Future<Thread> removeThreadFromBookmarks(Thread thread) {
    return _database.removeFromBookmarks(thread).then((value) {
      notifyListeners();
      return value;
    });
  }
}
