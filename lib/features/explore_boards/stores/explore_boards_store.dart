import 'package:fchan/data/repositories/api/boards_repository.dart';
import 'package:fchan/entities/board.dart';
import 'package:fchan/features/favorites/stores/favorites_store.dart';
import 'package:mobx/mobx.dart';

part 'explore_boards_store.g.dart';

class ExploreBoardsStore = _ExploreBoardsStore with _$ExploreBoardsStore;

abstract class _ExploreBoardsStore with Store {
  final BoardsRepository boardsRepository;
  final FavoritesStore favoritesStore;

  @observable
  var boards = ObservableList<Board>();

  @observable
  bool isBusy = false;

  @observable
  bool hasError = false;

  _ExploreBoardsStore({
    required this.boardsRepository,
    required this.favoritesStore,
  });

  @action
  Future<void> init() async {
    isBusy = true;
    hasError = false;
    try {
      boards
        ..clear()
        ..addAll(await boardsRepository.boards());
    } on Exception {
      hasError = true;
    }
    isBusy = false;
  }
}
