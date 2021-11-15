import 'package:fchan/data/providers/local/api/local_data_provider.dart';
import 'package:fchan/data/repositories/api/favorites_repository.dart';
import 'package:fchan/entities/board.dart';

class FavoritesRepositoryImpl extends FavoritesRepository {
  final LocalDataProvider localDataProvider;

  FavoritesRepositoryImpl({required this.localDataProvider});

  @override
  Future<List<Board>> favorites() => localDataProvider.favorites();

  @override
  Future<void> addBoardToFavorites(Board board) => localDataProvider.addBoardToFavorites(board);

  @override
  Future<void> removeBoardFromFavorites(Board board) => localDataProvider.removeBoardFromFavorites(board);
}
