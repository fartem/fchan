import 'package:fchan/entities/board.dart';

abstract class FavoritesRepository {
  Future<List<Board>> favorites();

  Future<void> addBoardToFavorites(Board board);

  Future<void> removeBoardFromFavorites(Board board);
}
