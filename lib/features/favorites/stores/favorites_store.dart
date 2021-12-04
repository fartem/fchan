import 'package:fchan/data/repositories/api/favorites_repository.dart';
import 'package:fchan/entities/board.dart';
import 'package:mobx/mobx.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStore with _$FavoritesStore;

abstract class _FavoritesStore with Store {
  final FavoritesRepository favoritesRepository;

  @observable
  var favorites = ObservableList<Board>();

  @observable
  bool isBusy = false;

  @observable
  bool hasError = false;

  _FavoritesStore({required this.favoritesRepository});

  @action
  Future<void> load() async {
    isBusy = true;
    hasError = false;
    try {
      favorites
        ..clear()
        ..addAll(await favoritesRepository.favorites());
    } on Exception {
      hasError = true;
    }
    isBusy = false;
  }
}
