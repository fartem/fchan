import 'package:freezed_annotation/freezed_annotation.dart';

part 'thread_event.freezed.dart';

@freezed
abstract class ThreadEvent with _$ThreadEvent {
  const factory ThreadEvent.initialized() = ThreadEventInitialized;

  const factory ThreadEvent.refreshRequested() = ThreadEventRefreshRequested;
}
