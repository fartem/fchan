import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../components/listcontroller/list_entity.dart';
import '../../components/listcontroller/list_portion_controller.dart';
import '../../data/repositories/data_repository.dart';
import '../../entities/board.dart';
import '../../entities/thread.dart';

part 'board_event.dart';
part 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  final DataRepository dataRepository;

  late ListPortionController _listPortionController;

  List<ListEntity> get threads => _listPortionController.items;

  BoardBloc({
    required this.dataRepository,
    required Board board,
  }) : super(BoardInitial()) {
    add(BoardEventInitialized());
    _listPortionController = ListPortionController<Thread>(
      portionProvider: (entityPage) => dataRepository.catalogForBoard(
        board,
        entityPage,
      ),
    );
  }

  @override
  Stream<BoardState> mapEventToState(
    BoardEvent event,
  ) async* {
    if (event is BoardEventInitialized) {
      yield* _mapBoardEventInitializedToState();
    } else if (event is BoardEventThreadPortionRequested) {
      yield* _mapBoardEventThreadPortionRequestToState();
    } else if (event is BoardEventBoardRefreshed) {
      yield* _mapBoardEventBoardRefreshedToState();
    }
  }

  Stream<BoardState> _mapBoardEventInitializedToState() async* {
    try {
      await _listPortionController.loadMore();
      yield BoardThreadsLoadSuccess(
        threads: _listPortionController.items,
      );
    } on Exception {
      yield BoardThreadsLoadError();
    }
  }

  Stream<BoardState> _mapBoardEventThreadPortionRequestToState() async* {
    await _listPortionController.loadMore();
    yield BoardThreadsLoadSuccess(
      threads: _listPortionController.items,
    );
  }

  Stream<BoardState> _mapBoardEventBoardRefreshedToState() async* {
    await _listPortionController.refresh();
    add(BoardEventInitialized());
    yield BoardInitial();
  }

  Future<void> addToHistory(Thread thread) async {
    if (!(await dataRepository.threadContainsInHistory(thread))) {
      dataRepository.addThreadToHistory(thread);
    } else {
      dataRepository.updateThreadInHistory(thread);
    }
  }
}
