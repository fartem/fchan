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
  }) : super(const ThreadStateInitial()) {
    add(const ThreadEventInitialized());
  }

  @override
  Stream<ThreadState> mapEventToState(
    ThreadEvent event,
  ) async* {
    yield* event.when(
      initialized: _mapEventToState,
      refreshRequested: _mapEventToState,
    );
  }

  Stream<ThreadState> _mapEventToState() async* {
    try {
      final posts = await dataRepository.remoteDataProvider.fetchPosts(thread);
      if (posts.isNotEmpty) {
        yield ThreadStateLoadSuccess(posts: posts);
      } else {
        yield const ThreadStateThreadsListIsEmpty();
      }
    } on Exception {
      yield const ThreadStateLoadError();
    }
  }
}
