import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';
import 'package:meta/meta.dart';

part 'thread_event.dart';

part 'thread_state.dart';

class ThreadBloc extends Bloc<ThreadEvent, ThreadState> {
  final DataRepository dataRepository;
  final Thread thread;

  ThreadBloc({
    required this.dataRepository,
    required this.thread,
  }) : super(ThreadInitial()) {
    add(ThreadEventInitialized());
  }

  @override
  Stream<ThreadState> mapEventToState(
    ThreadEvent event,
  ) async* {
    if (event is ThreadEventInitialized) {
      yield* _mapThreadEventInitializedToState();
    } else if (event is ThreadEventThreadRefreshRequested) {
      yield* _mapThreadEventThreadRefreshRequested();
    }
  }

  Stream<ThreadState> _mapThreadEventInitializedToState() async* {
    try {
      final posts = await dataRepository.remoteDataProvider.fetchPosts(thread);
      yield ThreadPostsLoadSuccess(posts: posts);
    } on Exception {
      yield ThreadPostsLoadError();
    }
  }

  Stream<ThreadState> _mapThreadEventThreadRefreshRequested() async* {
    try {
      final posts = await dataRepository.remoteDataProvider.fetchPosts(thread);
      yield ThreadPostsLoadSuccess(posts: posts);
    } on Exception {
      yield ThreadPostsLoadError();
    }
  }
}
