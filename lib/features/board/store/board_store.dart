import 'package:fchan/components/listcontroller/list_portion_controller.dart';
import 'package:fchan/data/repositories/api/threads_repository.dart';
import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/thread.dart';
import 'package:mobx/mobx.dart';

part 'board_store.g.dart';

class BoardStore = _BoardStore with _$BoardStore;

abstract class _BoardStore with Store {
  final ThreadsRepository threadsRepository;
  final Board board;

  late ListPortionController<Thread> _listPortionController;

  @observable
  var threads = ObservableList<Thread>();

  @observable
  ObservableFuture? initFuture;

  @observable
  bool isLastPage = false;

  @computed
  bool get isLoading => _listPortionController.isLoading;

  _BoardStore({
    required this.threadsRepository,
    required this.board,
  }) {
    _listPortionController = ListPortionController<Thread>(
      portionProvider: (entityPage) => threadsRepository.catalogForBoard(
        board,
        entityPage,
      ),
    );
  }

  Future<void> init() async {
    initFuture = ObservableFuture(_initThreads());
    try {
      await initFuture;
    } on Exception {
      initFuture = ObservableFuture.error('');
    }
  }

  Future<void> _initThreads() async {
    await _listPortionController.loadMore();
    threads
      ..clear()
      ..addAll(_listPortionController.items);
    isLastPage = _listPortionController.isLastPage;
  }
}
