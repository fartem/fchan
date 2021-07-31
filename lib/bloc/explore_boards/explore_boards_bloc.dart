import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/data_repository.dart';
import '../../entities/board.dart';

part 'explore_boards_event.dart';
part 'explore_boards_state.dart';

class ExploreBoardsBloc extends Bloc<ExploreBoardsEvent, ExploreBoardsState> {
  final DataRepository dataRepository;

  ExploreBoardsBloc({
    required this.dataRepository,
  }) : super(ExploreBoardsInitial()) {
    add(ExploreBoardsInitialized());
  }

  @override
  Stream<ExploreBoardsState> mapEventToState(
    ExploreBoardsEvent event,
  ) async* {
    if (event is ExploreBoardsInitialized) {
      try {
        final boards = await dataRepository.boards();
        yield ExploreBoardsLoadSuccess(boards: boards);
      } on Exception {
        yield ExploreBoardsLoadError();
      }
    } else if (event is ExploreBoardsBoardAddedToFavorites) {
      await dataRepository.addBoardToFavorites(event.board);
      yield ExploreBoardsInitial();
      add(ExploreBoardsInitialized());
    } else if (event is ExploreBoardsBoardRemovesFromFavorites) {
      await dataRepository.removeBoardFromFavorites(event.board);
      yield ExploreBoardsInitial();
      add(ExploreBoardsInitialized());
    }
  }

  void addBoardToFavorites(Board board) => add(
        ExploreBoardsBoardAddedToFavorites(
          board: board,
        ),
      );

  void remoteBoardFromFavorites(Board board) => add(
        ExploreBoardsBoardRemovesFromFavorites(
          board: board,
        ),
      );
}
