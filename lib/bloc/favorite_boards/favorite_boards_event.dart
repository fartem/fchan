part of 'favorite_boards_bloc.dart';

@immutable
abstract class FavoriteBoardsEvent {}

class FavoriteBoardsEventInitialized extends FavoriteBoardsEvent {}

class FavoriteBoardsEventBoardsUpdated extends FavoriteBoardsEvent {}
