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
  }) : super(const ExploreBoardsInitial()) {
    add(const ExploreBoardsInitialized());
  }

  @override
  Stream<ExploreBoardsState> mapEventToState(
    ExploreBoardsEvent event,
  ) async* {
    yield* event.when(
      exploreBoardsInitialized: _mapExploreBoardsEventInitializedToState,
      exploreBoardsBoardAddedToFavorites: (board) => _mapExploreBoardsEventBoardAddedToFavoritesToState(
        board: board,
      ),
      exploreBoardsBoardRemovedToFavorites: (board) => _mapExploreBoardsEventBoardRemovedFromFavoritesToState(
        board: board,
      ),
    );
  }

  Stream<ExploreBoardsState> _mapExploreBoardsEventInitializedToState() async* {
    try {
      final boards = await dataRepository.boards();
      if (boards.isNotEmpty) {
        yield ExploreBoardsLoadSuccess(boards: boards);
      } else {
        yield const ExploreBoardsAreEmpty();
      }
    } on Exception {
      yield const ExploreBoardsLoadError();
    }
  }

  Stream<ExploreBoardsState> _mapExploreBoardsEventBoardAddedToFavoritesToState({
    required Board board,
  }) async* {
    await dataRepository.addBoardToFavorites(board);
    yield const ExploreBoardsInitial();
    add(const ExploreBoardsInitialized());
  }

  Stream<ExploreBoardsState> _mapExploreBoardsEventBoardRemovedFromFavoritesToState({
    required Board board,
  }) async* {
    await dataRepository.removeBoardFromFavorites(board);
    yield const ExploreBoardsInitial();
    add(const ExploreBoardsInitialized());
  }

  void addBoardToFavorites(Board board) => add(
        ExploreBoardsBoardAddedToFavorites(
          board: board,
        ),
      );

  void remoteBoardFromFavorites(Board board) => add(
        ExploreBoardsBoardRemovedFromFavorites(
          board: board,
        ),
      );
}
