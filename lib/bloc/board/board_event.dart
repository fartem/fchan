import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_event.freezed.dart';

@freezed
abstract class BoardEvent with _$BoardEvent {
  const factory BoardEvent.initialized() = BoardEventInitialized;

  const factory BoardEvent.portionRequested() = BoardEventPortionRequested;

  const factory BoardEvent.refreshed() = BoardEventRefreshed;
}
