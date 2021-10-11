import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/bloc/explore_boards/explore_boards_event.dart';
import 'package:fchan/bloc/explore_boards/explore_boards_state.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/entities/board.dart';

class ExploreBoardsBloc extends Bloc<ExploreBoardsEvent, ExploreBoardsState> {
  final DataRepository dataRepository;

  ExploreBoardsBloc({
    required this.dataRepository,
  }) : super(const ExploreBoardsStateInitial()) {
    add(const ExploreBoardsEventInitialized());
  }

  @override
  Stream<ExploreBoardsState> mapEventToState(
    ExploreBoardsEvent event,
  ) async* {
    yield* event.when(
      initialized: _mapExploreBoardsEventInitializedToState,
      boardAddedToFavorites: (board) => _mapExploreBoardsEventBoardAddedToFavoritesToState(
        board: board,
      ),
      boardRemovedToFavorites: (board) => _mapExploreBoardsEventBoardRemovedFromFavoritesToState(
        board: board,
      ),
    );
  }

  Stream<ExploreBoardsState> _mapExploreBoardsEventInitializedToState() async* {
    try {
      final boards = await dataRepository.boards();
      if (boards.isNotEmpty) {
        yield ExploreBoardsStateLoadSuccess(boards: boards);
      } else {
        yield const ExploreBoardsStateLoadError();
      }
    } on Exception {
      yield const ExploreBoardsStateLoadError();
    }
  }

  Stream<ExploreBoardsState> _mapExploreBoardsEventBoardAddedToFavoritesToState({
    required Board board,
  }) async* {
    await dataRepository.addBoardToFavorites(board);
    yield const ExploreBoardsStateInitial();
    add(const ExploreBoardsEventInitialized());
  }

  Stream<ExploreBoardsState> _mapExploreBoardsEventBoardRemovedFromFavoritesToState({
    required Board board,
  }) async* {
    await dataRepository.removeBoardFromFavorites(board);
    yield const ExploreBoardsStateInitial();
    add(const ExploreBoardsEventInitialized());
  }

  void addBoardToFavorites(Board board) => add(
        ExploreBoardsEventBoardAddedToFavorites(
          board: board,
        ),
      );

  void remoteBoardFromFavorites(Board board) => add(
        ExploreBoardsEventBoardRemovedFromFavorites(
          board: board,
        ),
      );
}
