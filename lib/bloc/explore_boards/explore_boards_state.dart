part of 'explore_boards_bloc.dart';

@immutable
abstract class ExploreBoardsState {}

class ExploreBoardsInitial extends ExploreBoardsState {}

class ExploreBoardsLoadSuccess extends ExploreBoardsState {
  final List<Board> boards;

  ExploreBoardsLoadSuccess({required this.boards});
}

class ExploreBoardsLoadError extends ExploreBoardsState {}
