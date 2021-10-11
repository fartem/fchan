import 'package:fchan/entities/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'thread_state.freezed.dart';

@freezed
abstract class ThreadState with _$ThreadState {
  const factory ThreadState.initial() = ThreadStateInitial;

  const factory ThreadState.loadSuccess({
    required List<Post> posts,
  }) = ThreadStateLoadSuccess;

  const factory ThreadState.loadError() = ThreadStateLoadError;

  const factory ThreadState.threadsListIsEmpty() = ThreadStateThreadsListIsEmpty;
}
