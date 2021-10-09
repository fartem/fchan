import 'package:fchan/entities/thread.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_state.freezed.dart';

@freezed
abstract class BoardState with _$BoardState {
  const factory BoardState.initial() = Initial;

  const factory BoardState.threadsLoadSuccess({
    required List<Thread> threads,
    required bool isLastPage,
  }) = ThreadsLoadSuccess;

  const factory BoardState.threadsLoadError() = ThreadsLoadError;
}
