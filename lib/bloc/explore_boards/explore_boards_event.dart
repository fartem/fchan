part of 'explore_boards_bloc.dart';

@immutable
abstract class ExploreBoardsEvent {}

class ExploreBoardsEventInitialized extends ExploreBoardsEvent {}

class ExploreBoardsEventBoardAddedToFavorites extends ExploreBoardsEvent {
  final Board board;

  ExploreBoardsEventBoardAddedToFavorites({required this.board});
}

class ExploreBoardsEventBoardRemovesFromFavorites extends ExploreBoardsEvent {
  final Board board;

  ExploreBoardsEventBoardRemovesFromFavorites({required this.board});
}
