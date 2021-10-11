import 'package:fchan/entities/thread.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmarks_state.freezed.dart';

@freezed
abstract class BookmarksState with _$BookmarksState {
  const factory BookmarksState.initial() = BookmarksStateInitial;

  const factory BookmarksState.loadSuccess({
    required List<Thread> threads,
    required bool isLastPage,
  }) = BookmarksStateLoadSuccess;

  const factory BookmarksState.loadError() = BookmarksStateLoadError;

  const factory BookmarksState.clearInProgress() = BookmarksStateClearInProgress;

  const factory BookmarksState.bookmarksListIsEmpty() = BookmarksStateBookmarksListIsEmpty;
}
