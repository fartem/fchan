import 'package:fchan/entities/board.dart';
import 'package:fchan/logic/db/database.dart';
import 'package:flutter/material.dart';

class FavoriteBoardsModel with ChangeNotifier {
  final Database _database;

  FavoriteBoardsModel(this._database);

  Future<List<Board>> favoriteBoards() => _database.favoriteBoards();

  Future<Board> addFavoriteBoard(Board board) {
    return _database.addToFavorites(board).then((value) {
      notifyListeners();
      return value;
    });
  }

  Future<Board> removeFavoriteBoard(Board board) {
    return _database.removeFromFavorites(board).then((value) {
      notifyListeners();
      return value;
    });
  }
}
