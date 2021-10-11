import 'package:fchan/entities/thread.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_state.freezed.dart';

@freezed
abstract class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = HistoryStateInitial;

  const factory HistoryState.loadSuccess({
    required List<Thread> threads,
    required bool isLastPage,
  }) = HistoryStateLoadSuccess;

  const factory HistoryState.loadError() = HistoryStateLoadError;

  const factory HistoryState.historyIsEmpty() = HistoryStateHistoryIsEmpty;

  const factory HistoryState.clearInProgress() = HistoryStateClearInProgress;
}
