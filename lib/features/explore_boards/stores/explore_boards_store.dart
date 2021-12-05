import 'package:fchan/data/repositories/api/boards_repository.dart';
import 'package:fchan/entities/board.dart';
import 'package:mobx/mobx.dart';

part 'explore_boards_store.g.dart';

class ExploreBoardsStore = _ExploreBoardsStore with _$ExploreBoardsStore;

abstract class _ExploreBoardsStore with Store {
  final BoardsRepository boardsRepository;

  @observable
  var boards = ObservableList<Board>();

  @observable
  ObservableFuture? initFuture;

  _ExploreBoardsStore({required this.boardsRepository});

  @action
  Future<void> init() async {
    initFuture = ObservableFuture(_initBoards());
    try {
      await initFuture;
    } on Exception {
      initFuture = ObservableFuture.error('');
    }
  }

  Future<void> _initBoards() async => boards
    ..clear()
    ..addAll(await boardsRepository.boards());
}
