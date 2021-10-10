import 'package:fchan/entities/board.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_state.freezed.dart';

@freezed
abstract class FavoritesState with _$FavoritesState {
  const factory FavoritesState.favoritesInitial() = FavoritesInitial;

  const factory FavoritesState.favoritesLoadSuccess({
    required List<Board> favorites,
  }) = FavoritesLoadSuccess;

  const factory FavoritesState.favoritesLoadError() = FavoritesLoadError;

  const factory FavoritesState.favoritesAreEmpty() = FavoritesAreEmpty;
}
