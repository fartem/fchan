part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesEvent {}

class FavoritesInitialized extends FavoritesEvent {}

class FavoritesBoardsUpdated extends FavoritesEvent {}
