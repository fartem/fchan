import 'package:fchan/entities/thread.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_state.freezed.dart';

@freezed
abstract class BoardState with _$BoardState {
  const factory BoardState.initial() = BoardStateInitial;

  const factory BoardState.loadSuccess({
    required List<Thread> threads,
    required bool isLastPage,
  }) = BoardStateLoadSuccess;

  const factory BoardState.loadError() = BoardStateLoadError;

  const factory BoardState.isEmpty() = BoardStateIsEmpty;
}
