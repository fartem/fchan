import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/bloc/thread/thread_event.dart';
import 'package:fchan/bloc/thread/thread_state.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/entities/thread.dart';

class ThreadBloc extends Bloc<ThreadEvent, ThreadState> {
  final DataRepository dataRepository;
  final Thread thread;

  ThreadBloc({
    required this.dataRepository,
    required this.thread,
  }) : super(const ThreadInitial()) {
    add(const ThreadInitialized());
  }

  @override
  Stream<ThreadState> mapEventToState(
    ThreadEvent event,
  ) async* {
    yield* event.when(
      threadInitialized: _mapEventToState,
      threadRefreshRequested: _mapEventToState,
    );
  }

  Stream<ThreadState> _mapEventToState() async* {
    try {
      final posts = await dataRepository.remoteDataProvider.fetchPosts(thread);
      if (posts.isNotEmpty) {
        yield ThreadLoadSuccess(posts: posts);
      } else {
        yield const ThreadLoadError();
      }
    } on Exception {
      yield const ThreadLoadError();
    }
  }
}
