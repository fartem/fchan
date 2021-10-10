import 'package:fchan/entities/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'thread_state.freezed.dart';

@freezed
abstract class ThreadState with _$ThreadState {
  const factory ThreadState.threadInitial() = ThreadInitial;

  const factory ThreadState.threadLoadSuccess({
    required List<Post> posts,
  }) = ThreadLoadSuccess;

  const factory ThreadState.threadLoadError() = ThreadLoadError;

  const factory ThreadState.threadIsEmpty() = ThreadIsEmpty;
}
