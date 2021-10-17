import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/bloc/explore_boards/explore_boards_event.dart';
import 'package:fchan/bloc/explore_boards/explore_boards_state.dart';
import 'package:fchan/data/repositories/api/boards_repository.dart';
import 'package:fchan/data/repositories/api/favorites_repository.dart';
import 'package:fchan/entities/board.dart';

class ExploreBoardsBloc extends Bloc<ExploreBoardsEvent, ExploreBoardsState> {
  final BoardsRepository boardsRepository;
  final FavoritesRepository favoritesRepository;

  ExploreBoardsBloc({
    required this.boardsRepository,
    required this.favoritesRepository,
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
      final boards = await boardsRepository.boards();
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
    await favoritesRepository.addBoardToFavorites(board);
    yield const ExploreBoardsStateInitial();
    add(const ExploreBoardsEventInitialized());
  }

  Stream<ExploreBoardsState> _mapExploreBoardsEventBoardRemovedFromFavoritesToState({
    required Board board,
  }) async* {
    await favoritesRepository.removeBoardFromFavorites(board);
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
