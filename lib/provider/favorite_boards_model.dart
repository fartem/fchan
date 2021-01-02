import 'package:flutter/material.dart';

import '../entities/board.dart';
import '../logic/repository/repository.dart';

class FavoriteBoardsModel extends ChangeNotifier {
  final FChanRepository _fChanRepository;

  FavoriteBoardsModel(this._fChanRepository);

  Future<List<Board>> allBoards() => _fChanRepository.boards();

  Future<List<Board>> favoriteBoards() => _fChanRepository.favoriteBoards();

  Future<Board> addToFavorites(Board board) async {
    await _fChanRepository.addBoardToFavorites(board);
    notifyListeners();
    return board;
  }

  Future<Board> removeFromFavorites(Board board) async {
    await _fChanRepository.removeBoardFromFavorites(board);
    notifyListeners();
    return board;
  }
}
