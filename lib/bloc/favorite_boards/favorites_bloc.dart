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
    add(FavoritesEventInitialized());
  }

  @override
  Stream<FavoritesState> mapEventToState(
    FavoritesEvent event,
  ) async* {
    if (event is FavoritesEventInitialized) {
      yield* _mapFavoritesEventInitializedToState();
    } else if (event is FavoritesEventBoardsUpdated) {
      yield* _mapFavoritesEventBoardsUpdated();
    }
  }

  Stream<FavoritesState> _mapFavoritesEventInitializedToState() async* {
    try {
      final favorites = await dataRepository.favorites();
      yield FavoritesLoadSuccess(favorites: favorites);
    } on Exception {
      yield FavoritesLoadError();
    }
  }

  Stream<FavoritesState> _mapFavoritesEventBoardsUpdated() async* {
    yield FavoritesInitial();
    add(FavoritesEventInitialized());
  }
}
