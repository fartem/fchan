import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/bloc/favorite_boards/favorites_event.dart';
import 'package:fchan/bloc/favorite_boards/favorites_state.dart';
import 'package:fchan/data/repositories/data_repository.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final DataRepository dataRepository;

  FavoritesBloc({required this.dataRepository}) : super(const FavoritesStateInitial()) {
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
      final favorites = await dataRepository.favorites();
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
