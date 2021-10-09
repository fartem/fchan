import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/bloc/board/board_event.dart';
import 'package:fchan/bloc/board/board_state.dart';
import 'package:fchan/components/listcontroller/list_portion_controller.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/thread.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  final DataRepository dataRepository;

  late ListPortionController<Thread> _listPortionController;

  BoardBloc({
    required this.dataRepository,
    required Board board,
  }) : super(const Initial()) {
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
    yield* event.when(
      initialized: _mapBoardEventInitializedToState,
      threadsPortionRequested: _mapBoardEventThreadPortionRequestToState,
      boardRefreshed: _mapBoardEventBoardRefreshedToState,
    );
  }

  Stream<BoardState> _mapBoardEventInitializedToState() async* {
    try {
      await _listPortionController.loadMore();
      yield ThreadsLoadSuccess(
        threads: List.unmodifiable(_listPortionController.items),
        isLastPage: _listPortionController.isLastPage,
      );
    } on Exception {
      yield const ThreadsLoadError();
    }
  }

  Stream<BoardState> _mapBoardEventThreadPortionRequestToState() async* {
    await _listPortionController.loadMore();
    yield ThreadsLoadSuccess(
      threads: List.unmodifiable(_listPortionController.items),
      isLastPage: _listPortionController.isLastPage,
    );
  }

  Stream<BoardState> _mapBoardEventBoardRefreshedToState() async* {
    await _listPortionController.reset();
    add(const Initialized());
    yield const Initial();
  }

  Future<void> addToHistory(Thread thread) async {
    if (!(await dataRepository.threadContainsInHistory(thread))) {
      await dataRepository.addThreadToHistory(thread);
    } else {
      await dataRepository.updateThreadInHistory(thread);
    }
  }
}
