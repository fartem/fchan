part of 'favorite_boards_bloc.dart';

@immutable
abstract class FavoriteBoardsEvent {}

class FavoriteBoardsInitialized extends FavoriteBoardsEvent {}

class FavoriteBoardsBoardsUpdated extends FavoriteBoardsEvent {}
