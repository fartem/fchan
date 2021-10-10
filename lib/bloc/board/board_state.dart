import 'package:fchan/entities/thread.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_state.freezed.dart';

@freezed
abstract class BoardState with _$BoardState {
  const factory BoardState.boardInitial() = BoardInitial;

  const factory BoardState.boardLoadSuccess({
    required List<Thread> threads,
    required bool isLastPage,
  }) = BoardLoadSuccess;

  const factory BoardState.boardLoadError() = BoardLoadError;

  const factory BoardState.boardIsEmpty() = BoardIsEmpty;
}
