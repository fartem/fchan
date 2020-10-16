import 'package:fchan/entities/board.dart';
import 'package:fchan/logic/repository/repository.dart';
import 'package:flutter/material.dart';

class BoardsModel with ChangeNotifier {
  final FChanRepository _fChanRepository;

  BoardsModel(this._fChanRepository);

  Future<List<Board>> boards() => _fChanRepository.boards();

  Future<List<Board>> favoriteBoards() => _fChanRepository.favoriteBoards();

  Future<Board> addFavoriteBoard(Board board) {
    return _fChanRepository.addBoardToFavorites(board).then((favoriteBoard) {
      notifyListeners();
      return favoriteBoard;
    });
  }

  Future<Board> removeFavoriteBoard(Board board) {
    return _fChanRepository.removeBoardFromFavorites(board).then((removedBoard) {
      notifyListeners();
      return removedBoard;
    });
  }
}
