import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/data_repository.dart';
import '../../entities/board.dart';
import '../../entities/thread.dart';
import '../../logic/listcontroller/list_entity.dart';
import '../../logic/listcontroller/list_portion_controller.dart';

part 'board_event.dart';

part 'board_state.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  final DataRepository dataRepository;

  late ListPortionController _listPortionController;

  BoardBloc({
    required this.dataRepository,
    required Board board,
  }) : super(BoardInitial()) {
    add(BoardEventInitialized());
    _listPortionController = ListPortionController<Thread>(
      (entityPage) => dataRepository.catalogForBoard(
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
      try {
        await _listPortionController.loadMore();
        yield BoardThreadsLoadSuccess(
          threads: _listPortionController.items,
        );
      } on Exception {
        yield BoardThreadsLoadError();
      }
    } else if (event is BoardEventThreadPortionRequested) {
      await _listPortionController.loadMore();
      yield BoardThreadsLoadSuccess(
        threads: _listPortionController.items,
      );
    } else if (event is BoardEventBoardRefreshed) {
      await _listPortionController.refresh();
      add(BoardEventInitialized());
      yield BoardInitial();
    }
  }
}
