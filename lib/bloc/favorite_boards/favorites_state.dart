import 'package:fchan/entities/board.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_state.freezed.dart';

@freezed
abstract class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = FavoritesStateInitial;

  const factory FavoritesState.loadSuccess({
    required List<Board> favorites,
  }) = FavoritesStateLoadSuccess;

  const factory FavoritesState.loadError() = FavoritesStateLoadError;

  const factory FavoritesState.favoritesListIsEmpty() = FavoritesStateFavoritesListIsEmpty;
}
