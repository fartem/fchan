part of 'history_bloc.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryThreadsLoadSuccess extends HistoryState {
  final List<Thread> threads;

  HistoryThreadsLoadSuccess({required this.threads});
}

class HistoryThreadsLoadError extends HistoryState {}

class HistoryClearInProgress extends HistoryState {}
