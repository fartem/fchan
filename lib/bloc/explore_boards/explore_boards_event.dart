part of 'explore_boards_bloc.dart';

@immutable
abstract class ExploreBoardsEvent {}

class ExploreBoardsInitialized extends ExploreBoardsEvent {}

class ExploreBoardsBoardAddedToFavorites extends ExploreBoardsEvent {
  final Board board;

  ExploreBoardsBoardAddedToFavorites({required this.board});
}

class ExploreBoardsBoardRemovesFromFavorites extends ExploreBoardsEvent {
  final Board board;

  ExploreBoardsBoardRemovesFromFavorites({required this.board});
}
