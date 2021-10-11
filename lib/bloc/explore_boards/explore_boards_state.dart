import 'package:fchan/entities/board.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_boards_state.freezed.dart';

@freezed
abstract class ExploreBoardsState with _$ExploreBoardsState {
  const factory ExploreBoardsState.initial() = ExploreBoardsStateInitial;

  const factory ExploreBoardsState.loadSuccess({
    required List<Board> boards,
  }) = ExploreBoardsStateLoadSuccess;

  const factory ExploreBoardsState.loadError() = ExploreBoardsStateLoadError;

  const factory ExploreBoardsState.boardsListIsEmpty() = ExploreBoardsBoardsListIsEmpty;
}
