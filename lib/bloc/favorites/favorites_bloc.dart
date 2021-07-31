import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/data_repository.dart';
import '../../entities/board.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final DataRepository dataRepository;

  FavoritesBloc({required this.dataRepository}) : super(FavoritesInitial()) {
    add(FavoritesInitialized());
  }

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    if (event is FavoritesInitialized) {
      try {
        final favorites = await dataRepository.favoriteBoards();
        yield FavoritesLoadSuccess(favorites: favorites);
      } on Exception {
        yield FavoritesLoadError();
      }
    } else if (event is FavoritesBoardsUpdated) {
      yield FavoritesInitial();
      add(FavoritesInitialized());
    }
  }
}
