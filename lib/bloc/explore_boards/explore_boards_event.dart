import 'package:fchan/entities/board.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_boards_event.freezed.dart';

@freezed
abstract class ExploreBoardsEvent with _$ExploreBoardsEvent {
  const ExploreBoardsEvent._();

  const factory ExploreBoardsEvent.exploreBoardsInitialized() = ExploreBoardsInitialized;

  const factory ExploreBoardsEvent.exploreBoardsBoardAddedToFavorites({
    required Board board,
  }) = ExploreBoardsBoardAddedToFavorites;

  const factory ExploreBoardsEvent.exploreBoardsBoardRemovedToFavorites({
    required Board board
  }) = ExploreBoardsBoardRemovedFromFavorites;
}
