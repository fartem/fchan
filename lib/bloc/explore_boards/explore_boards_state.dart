import 'package:fchan/entities/board.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_boards_state.freezed.dart';

@freezed
abstract class ExploreBoardsState with _$ExploreBoardsState {
  const factory ExploreBoardsState.exploreBoardsInitial() = ExploreBoardsInitial;

  const factory ExploreBoardsState.exploreBoardsLoadSuccess({
    required List<Board> boards,
  }) = ExploreBoardsLoadSuccess;

  const factory ExploreBoardsState.exploreBoardsLoadError() = ExploreBoardsLoadError;

  const factory ExploreBoardsState.exploreBoardsAreEmpty() = ExploreBoardsAreEmpty;
}
