import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/bloc/board/board_event.dart';
import 'package:fchan/bloc/board/board_state.dart';
import 'package:fchan/components/listcontroller/list_entity.dart';
import 'package:fchan/components/listcontroller/list_portion_controller.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/thread.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  final DataRepository dataRepository;

  late ListPortionController _listPortionController;

  List<ListEntity> get threads => _listPortionController.items;

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
      yield const ThreadsLoadError();
    }
  }

  Stream<BoardState> _mapBoardEventThreadPortionRequestToState() async* {
    yield const NewPortionLoading();
    await _listPortionController.loadMore();
    yield ThreadsLoadSuccess(
      threads: _listPortionController.items,
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
