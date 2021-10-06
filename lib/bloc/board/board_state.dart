import 'package:fchan/components/listcontroller/list_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_state.freezed.dart';

@freezed
abstract class BoardState with _$BoardState {
  const factory BoardState.initial() = Initial;

  const factory BoardState.threadsLoadSuccess({
    required List<ListEntity> threads,
  }) = ThreadsLoadSuccess;

  const factory BoardState.newPortionLoading() = NewPortionLoading;

  const factory BoardState.threadsLoadError() = ThreadsLoadError;
}
