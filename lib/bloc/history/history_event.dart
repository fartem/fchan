import 'package:fchan/entities/thread.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_event.freezed.dart';

@freezed
abstract class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.initialized() = HistoryEventInitialized;

  const factory HistoryEvent.portionRequested() = HistoryEventPortionRequested;

  const factory HistoryEvent.updateRequested() = HistoryEventUpdateRequested;

  const factory HistoryEvent.clearRequested() = HistoryEventClearRequested;

  const factory HistoryEvent.threadRemovedFromHistory({
    required Thread thread,
  }) = HistoryEventThreadRemovedFromHistory;
}
