part of 'favorite_boards_bloc.dart';

@immutable
abstract class FavoriteBoardsState {}

class FavoriteBoardsInitial extends FavoriteBoardsState {}

class FavoriteBoardsLoadSuccess extends FavoriteBoardsState {
  final List<Board> favorites;

  FavoriteBoardsLoadSuccess({required this.favorites});
}

class FavoriteBoardsLoadError extends FavoriteBoardsState {}
