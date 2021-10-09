import 'package:fchan/entities/thread.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmarks_state.freezed.dart';

@freezed
abstract class BookmarksState with _$BookmarksState {
  const factory BookmarksState.bookmarksInitial() = BookmarksInitial;

  const factory BookmarksState.bookmarksLoadSuccess({
    required List<Thread> threads,
    required bool isLastPage,
}) = BookmarksLoadSuccess;

  const factory BookmarksState.bookmarksLoadError() = BookmarksLoadError;

  const factory BookmarksState.bookmarksClearInProgress() = BookmarksClearInProgress;

  const factory BookmarksState.bookmarksIsEmpty() = BookmarksIsEmpty;
}
