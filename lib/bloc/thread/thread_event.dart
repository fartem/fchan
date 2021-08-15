part of 'thread_bloc.dart';

@immutable
abstract class ThreadEvent {}

class ThreadEventInitialized extends ThreadEvent {}

class ThreadEventThreadRefreshRequest extends ThreadEvent {}
