import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../components/listcontroller/list_entity.dart';
import '../../components/listcontroller/list_portion_controller.dart';
import '../../data/repositories/data_repository.dart';
import '../../entities/board.dart';
import '../../entities/thread.dart';

import 'board_event.dart';
import 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  final DataRepository dataRepository;

  late ListPortionController _listPortionController;

  List<ListEntity> get threads => _listPortionController.items;

  BoardBloc({
    required this.dataRepository,
    required Board board,
  }) : super(Initial()) {
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
    if (event is Initialized) {
      yield* _mapBoardEventInitializedToState();
    } else if (event is ThreadPortionRequested) {
      yield* _mapBoardEventThreadPortionRequestToState();
    } else if (event is BoardRefreshed) {
      yield* _mapBoardEventBoardRefreshedToState();
    }
  }

  Stream<BoardState> _mapBoardEventInitializedToState() async* {
    try {
      await _listPortionController.loadMore();
      yield ThreadsLoadSuccess(
        threads: _listPortionController.items,
      );
    } on Exception {
      yield ThreadsLoadError();
    }
  }

  Stream<BoardState> _mapBoardEventThreadPortionRequestToState() async* {
    await _listPortionController.loadMore();
    yield ThreadsLoadSuccess(
      threads: _listPortionController.items,
    );
  }

  Stream<BoardState> _mapBoardEventBoardRefreshedToState() async* {
    await _listPortionController.reset();
    add(Initialized());
    yield Initial();
  }

  Future<void> addToHistory(Thread thread) async {
    if (!(await dataRepository.threadContainsInHistory(thread))) {
      dataRepository.addThreadToHistory(thread);
    } else {
      dataRepository.updateThreadInHistory(thread);
    }
  }
}
