import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_event.freezed.dart';

@freezed
abstract class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.initialized() = HistoryEventInitialized;

  const factory HistoryEvent.portionRequested() = HistoryEventPortionRequested;

  const factory HistoryEvent.clearRequested() = HistoryEventClearRequested;
}
