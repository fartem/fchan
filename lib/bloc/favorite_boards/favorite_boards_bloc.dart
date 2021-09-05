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
    add(FavoriteBoardsInitialized());
  }

  @override
  Stream<FavoriteBoardsState> mapEventToState(
    FavoriteBoardsEvent event,
  ) async* {
    if (event is FavoriteBoardsInitialized) {
      try {
        final favorites = await dataRepository.favoriteBoards();
        yield FavoriteBoardsLoadSuccess(favorites: favorites);
      } on Exception {
        yield FavoriteBoardsLoadError();
      }
    } else if (event is FavoriteBoardsBoardsUpdated) {
      yield FavoriteBoardsInitial();
      add(FavoriteBoardsInitialized());
    }
  }
}
