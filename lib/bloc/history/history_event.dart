part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {}

class HistoryEventInitialized extends HistoryEvent {}

class HistoryEventThreadPortionRequested extends HistoryEvent {}
