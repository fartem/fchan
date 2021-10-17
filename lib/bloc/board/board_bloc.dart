import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/bloc/board/board_event.dart';
import 'package:fchan/bloc/board/board_state.dart';
import 'package:fchan/components/listcontroller/list_portion_controller.dart';
import 'package:fchan/data/repositories/api/history_repository.dart';
import 'package:fchan/data/repositories/api/threads_repository.dart';
import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/thread.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  final ThreadsRepository threadsRepository;
  final HistoryRepository historyRepository;

  late ListPortionController<Thread> _listPortionController;

  BoardBloc({
    required this.threadsRepository,
    required this.historyRepository,
    required Board board,
  }) : super(const BoardStateInitial()) {
    _listPortionController = ListPortionController<Thread>(
      portionProvider: (entityPage) => threadsRepository.catalogForBoard(
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
      portionRequested: _mapBoardEventThreadPortionRequestToState,
      refreshed: _mapBoardEventBoardRefreshedToState,
    );
  }

  Stream<BoardState> _mapBoardEventInitializedToState() async* {
    try {
      await _listPortionController.loadMore();
      if (_listPortionController.items.isNotEmpty) {
        yield BoardStateLoadSuccess(
          threads: List.unmodifiable(_listPortionController.items),
          isLastPage: _listPortionController.isLastPage,
        );
      } else {
        yield const BoardStateIsEmpty();
      }
    } on Exception {
      yield const BoardStateLoadError();
    }
  }

  Stream<BoardState> _mapBoardEventThreadPortionRequestToState() async* {
    await _listPortionController.loadMore();
    yield BoardStateLoadSuccess(
      threads: List.unmodifiable(_listPortionController.items),
      isLastPage: _listPortionController.isLastPage,
    );
  }

  Stream<BoardState> _mapBoardEventBoardRefreshedToState() async* {
    await _listPortionController.reset();
    add(const BoardEventInitialized());
    yield const BoardStateInitial();
  }

  Future<void> addToHistory(Thread thread) async {
    if (!(await historyRepository.threadContainsInHistory(thread))) {
      await historyRepository.addThreadToHistory(thread);
    } else {
      await historyRepository.updateThreadInHistory(thread);
    }
  }
}
