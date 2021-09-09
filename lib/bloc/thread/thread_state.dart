part of 'thread_bloc.dart';

@immutable
abstract class ThreadState {}

class ThreadInitial extends ThreadState {}

class ThreadPostsLoadSuccess extends ThreadState {
  final List<Post> posts;

  ThreadPostsLoadSuccess({required this.posts});
}

class ThreadPostsLoadError extends ThreadState {}
