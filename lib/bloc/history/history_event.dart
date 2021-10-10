import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_event.freezed.dart';

@freezed
abstract class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.historyInitialized() = HistoryInitialized;

  const factory HistoryEvent.historyPortionRequested() = HistoryPortionRequested;

  const factory HistoryEvent.historyClearRequested() = HistoryClearRequested;
}
