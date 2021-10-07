import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/entities/board.dart';
import 'package:meta/meta.dart';

part 'explore_boards_event.dart';

part 'explore_boards_state.dart';

class ExploreBoardsBloc extends Bloc<ExploreBoardsEvent, ExploreBoardsState> {
  final DataRepository dataRepository;

  ExploreBoardsBloc({
    required this.dataRepository,
  }) : super(ExploreBoardsInitial()) {
    add(ExploreBoardsEventInitialized());
  }

  @override
  Stream<ExploreBoardsState> mapEventToState(
    ExploreBoardsEvent event,
  ) async* {
    if (event is ExploreBoardsEventInitialized) {
      yield* _mapExploreBoardsEventInitializedToState();
    } else if (event is ExploreBoardsEventBoardAddedToFavorites) {
      yield* _mapExploreBoardsEventBoardAddedToFavoritesToState(event: event);
    } else if (event is ExploreBoardsEventBoardRemovesFromFavorites) {
      yield* _mapExploreBoardsEventBoardRemovesFromFavoritesToState(event: event);
    }
  }

  Stream<ExploreBoardsState> _mapExploreBoardsEventInitializedToState() async* {
    try {
      final boards = await dataRepository.boards();
      yield ExploreBoardsLoadSuccess(boards: boards);
    } on Exception {
      yield ExploreBoardsLoadError();
    }
  }

  Stream<ExploreBoardsState> _mapExploreBoardsEventBoardAddedToFavoritesToState({
    required ExploreBoardsEventBoardAddedToFavorites event,
  }) async* {
    await dataRepository.addBoardToFavorites(event.board);
    yield ExploreBoardsInitial();
    add(ExploreBoardsEventInitialized());
  }

  Stream<ExploreBoardsState> _mapExploreBoardsEventBoardRemovesFromFavoritesToState({
    required ExploreBoardsEventBoardRemovesFromFavorites event,
  }) async* {
    await dataRepository.removeBoardFromFavorites(event.board);
    yield ExploreBoardsInitial();
    add(ExploreBoardsEventInitialized());
  }

  void addBoardToFavorites(Board board) => add(
        ExploreBoardsEventBoardAddedToFavorites(
          board: board,
        ),
      );

  void remoteBoardFromFavorites(Board board) => add(
        ExploreBoardsEventBoardRemovesFromFavorites(
          board: board,
        ),
      );
}
