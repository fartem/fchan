import 'package:fchan/entities/thread.dart';
import 'package:fchan/logic/db/fchan_database.dart';
import 'package:flutter/material.dart';

class BookmarkThreadsModel with ChangeNotifier {
  // final Repository _repository;
  //
  // BookmarkThreadsModel(this._repository);

  // Future<DataPage<Thread>> bookmarks(Portion portion) => _database.bookmarks(portion);

  Future<DataPage<Thread>> bookmarks(Portion portion) => null;

  Future<Thread> addThreadToBookmarks(Thread thread) {
    // return _database.addToBookmarks(thread).then((value) {
    //   notifyListeners();
    //   return value;
    // });
    return null;
  }

  Future<Thread> removeThreadFromBookmarks(Thread thread) {
    // return _database.removeFromBookmarks(thread).then((value) {
    //   notifyListeners();
    //   return value;
    // });
    return null;
  }
}
