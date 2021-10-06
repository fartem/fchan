import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_event.freezed.dart';

@freezed
abstract class BoardEvent with _$BoardEvent {
  const BoardEvent._();

  const factory BoardEvent.initialized() = Initialized;

  const factory BoardEvent.threadsPortionRequested() = ThreadPortionRequested;

  const factory BoardEvent.boardRefreshed() = BoardRefreshed;
}
