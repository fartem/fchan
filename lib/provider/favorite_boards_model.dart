import 'package:fchan/entities/board.dart';
import 'package:flutter/material.dart';

class FavoriteBoardsModel with ChangeNotifier {
  final List<Board> favoriteBoards = [];

  void refreshFavoriteBoards(List<Board> favorites) {
    favoriteBoards.clear();
    favoriteBoards.addAll(favorites);
    notifyListeners();
  }

  void addFavoriteBoard(Board board) {
    favoriteBoards.add(board);
    notifyListeners();
  }

  void removeFavoriteBoard(Board board) {
    favoriteBoards.remove(board);
    notifyListeners();
  }
}
