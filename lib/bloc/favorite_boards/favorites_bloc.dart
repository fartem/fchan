import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/bloc/favorite_boards/favorites_event.dart';
import 'package:fchan/bloc/favorite_boards/favorites_state.dart';
import 'package:fchan/data/repositories/api/favorites_repository.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository favoritesRepository;

  FavoritesBloc({required this.favoritesRepository}) : super(const FavoritesStateInitial()) {
    add(const FavoritesEventInitialized());
  }

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    yield* event.when(
      initialized: _mapFavoritesEventInitializedToState,
      favoritesListWasUpdated: _mapFavoritesEventBoardsUpdatedToState,
    );
  }

  Stream<FavoritesState> _mapFavoritesEventInitializedToState() async* {
    try {
      final favorites = await favoritesRepository.favorites();
      if (favorites.isNotEmpty) {
        yield FavoritesStateLoadSuccess(favorites: favorites);
      } else {
        yield const FavoritesStateFavoritesListIsEmpty();
      }
    } on Exception {
      yield const FavoritesStateLoadError();
    }
  }

  Stream<FavoritesState> _mapFavoritesEventBoardsUpdatedToState() async* {
    yield const FavoritesStateInitial();
    add(const FavoritesEventInitialized());
  }
}
