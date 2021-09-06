import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/data_repository.dart';
import '../../entities/board.dart';

part 'favorite_boards_event.dart';

part 'favorite_boards_state.dart';

class FavoriteBoardsBloc extends Bloc<FavoriteBoardsEvent, FavoriteBoardsState> {
  final DataRepository dataRepository;

  FavoriteBoardsBloc({required this.dataRepository}) : super(FavoriteBoardsInitial()) {
    add(FavoriteBoardsEventInitialized());
  }

  @override
  Stream<FavoriteBoardsState> mapEventToState(
    FavoriteBoardsEvent event,
  ) async* {
    if (event is FavoriteBoardsEventInitialized) {
      yield* _mapFavoriteBoardsEventInitializedToState();
    } else if (event is FavoriteBoardsEventBoardsUpdated) {
      yield* _mapFavoriteBoardsEventBoardsUpdated();
    }
  }

  Stream<FavoriteBoardsState> _mapFavoriteBoardsEventInitializedToState() async* {
    try {
      final favorites = await dataRepository.favoriteBoards();
      yield FavoriteBoardsLoadSuccess(favorites: favorites);
    } on Exception {
      yield FavoriteBoardsLoadError();
    }
  }

  Stream<FavoriteBoardsState> _mapFavoriteBoardsEventBoardsUpdated() async* {
    yield FavoriteBoardsInitial();
    add(FavoriteBoardsEventInitialized());
  }
}
