import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_event.freezed.dart';

@freezed
abstract class BoardEvent with _$BoardEvent {
  const factory BoardEvent.boardInitialized() = BoardInitialized;

  const factory BoardEvent.boardPortionRequested() = BoardPortionRequested;

  const factory BoardEvent.boardRefreshed() = BoardRefreshed;
}
