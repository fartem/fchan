import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/bloc/favorite_boards/favorites_event.dart';
import 'package:fchan/bloc/favorite_boards/favorites_state.dart';
import 'package:fchan/data/repositories/data_repository.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final DataRepository dataRepository;

  FavoritesBloc({required this.dataRepository}) : super(const FavoritesInitial()) {
    add(const FavoritesInitialized());
  }

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    yield* event.when(
      favoritesInitialized: _mapFavoritesEventInitializedToState,
      favoritesWasUpdated: _mapFavoritesEventBoardsUpdatedToState,
    );
  }

  Stream<FavoritesState> _mapFavoritesEventInitializedToState() async* {
    try {
      final favorites = await dataRepository.favorites();
      if (favorites.isNotEmpty) {
        yield FavoritesLoadSuccess(favorites: favorites);
      } else {
        yield const FavoritesAreEmpty();
      }
    } on Exception {
      yield const FavoritesLoadError();
    }
  }

  Stream<FavoritesState> _mapFavoritesEventBoardsUpdatedToState() async* {
    yield const FavoritesInitial();
    add(const FavoritesInitialized());
  }
}
