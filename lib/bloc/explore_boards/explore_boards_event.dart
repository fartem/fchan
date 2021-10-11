import 'package:fchan/entities/board.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_boards_event.freezed.dart';

@freezed
abstract class ExploreBoardsEvent with _$ExploreBoardsEvent {
  const factory ExploreBoardsEvent.initialized() = ExploreBoardsEventInitialized;

  const factory ExploreBoardsEvent.boardAddedToFavorites({
    required Board board,
  }) = ExploreBoardsEventBoardAddedToFavorites;

  const factory ExploreBoardsEvent.boardRemovedToFavorites({
    required Board board,
  }) = ExploreBoardsEventBoardRemovedFromFavorites;
}
