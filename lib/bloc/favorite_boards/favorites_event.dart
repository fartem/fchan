part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesEvent {}

class FavoritesEventInitialized extends FavoritesEvent {}

class FavoritesEventBoardsUpdated extends FavoritesEvent {}
