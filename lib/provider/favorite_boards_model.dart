import 'package:flutter/material.dart';

import '../data/repositories/data_repository.dart';
import '../entities/board.dart';

class FavoriteBoardsModel extends ChangeNotifier {
  final DataRepository _fChanRepository;

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
