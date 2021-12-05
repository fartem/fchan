import 'package:fchan/data/repositories/api/favorites_repository.dart';
import 'package:fchan/entities/board.dart';
import 'package:mobx/mobx.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStore with _$FavoritesStore;

abstract class _FavoritesStore with Store {
  final FavoritesRepository favoritesRepository;

  @observable
  var favorites = ObservableSet<Board>();

  @observable
  ObservableFuture? initFuture;

  _FavoritesStore({required this.favoritesRepository});

  @action
  Future<void> load() async {
    initFuture = ObservableFuture(_initFavorites());
    try {
      await initFuture;
    } on Exception {
      initFuture = ObservableFuture.error('');
    }
  }

  Future<void> _initFavorites() async => favorites
    ..clear()
    ..addAll(await favoritesRepository.favorites());

  @action
  Future<void> addToFavorites(Board board) async {
    favorites.add(board);
    await favoritesRepository.addBoardToFavorites(board);
  }

  @action
  Future<void> removeFromFavorites(Board board) async {
    favorites.remove(board);
    await favoritesRepository.removeBoardFromFavorites(board);
  }
}
