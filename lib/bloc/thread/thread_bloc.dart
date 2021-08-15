import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/data_repository.dart';
import '../../entities/post.dart';
import '../../entities/thread.dart';

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
    if (event is ThreadEventInitialized || event is ThreadEventThreadRefreshRequest) {
      try {
        final posts = await dataRepository.remoteDataProvider.fetchPosts(thread);
        yield ThreadPostsLoadSuccess(posts: posts);
      } on Exception {
        yield ThreadPostsLoadError();
      }
    }
  }
}
