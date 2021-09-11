part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoadSuccess extends FavoritesState {
  final List<Board> favorites;

  FavoritesLoadSuccess({required this.favorites});
}

class FavoritesLoadError extends FavoritesState {}
