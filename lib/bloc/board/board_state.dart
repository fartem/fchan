part of 'board_bloc.dart';

@immutable
abstract class BoardState {}

class BoardInitial extends BoardState {}

class BoardThreadsLoadSuccess extends BoardState {
  final List<ListEntity> threads;

  BoardThreadsLoadSuccess({required this.threads});
}

class BoardThreadsLoadError extends BoardState {}
