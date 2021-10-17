import 'package:collection/collection.dart';
import 'package:fchan/data/providers/remote/api/remote_data_provider.dart';
import 'package:fchan/data/repositories/api/boards_repository.dart';
import 'package:fchan/data/repositories/api/favorites_repository.dart';
import 'package:fchan/entities/board.dart';

class BoardsRepositoryImpl extends BoardsRepository {
  final RemoteDataProvider remoteDataProvider;
  final FavoritesRepository favoritesRepository;

  final _boardsSessionCache = <Board>[];

  BoardsRepositoryImpl({
    required this.remoteDataProvider,
    required this.favoritesRepository,
  });

  @override
  Future<List<Board>> boards() async {
    if (_boardsSessionCache.isEmpty) {
      final favoriteBoards = await favoritesRepository.favorites();
      final result = <Board>[];
      final boards = await remoteDataProvider.fetchBoards();
      for (final board in boards) {
        final favorite = favoriteBoards.firstWhereOrNull(
          (favorite) => favorite == board,
        );
        if (favorite != null) {
          result.add(favorite);
        } else {
          result.add(board);
        }
      }
      _boardsSessionCache.addAll(result);
    }
    return _boardsSessionCache;
  }
}
