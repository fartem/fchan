part of 'board_bloc.dart';

@immutable
abstract class BoardEvent {}

class BoardEventInitialized extends BoardEvent {}

class BoardEventThreadPortionRequested extends BoardEvent {}

class BoardEventBoardRefreshed extends BoardEvent {}
