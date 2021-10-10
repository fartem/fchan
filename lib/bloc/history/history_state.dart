import 'package:fchan/entities/thread.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_state.freezed.dart';

@freezed
abstract class HistoryState with _$HistoryState {
  const factory HistoryState.historyInitial() = HistoryInitial;

  const factory HistoryState.historyLoadSuccess({
    required List<Thread> threads,
    required bool isLastPage,
  }) = HistoryLoadSuccess;

  const factory HistoryState.historyLoadError() = HistoryLoadError;

  const factory HistoryState.historyIsEmpty() = HistoryIsEmpty;

  const factory HistoryState.historyClearInProgress() = HistoryClearInProgress;
}
