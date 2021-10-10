import 'package:fchan/entities/thread.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmarks_event.freezed.dart';

@freezed
abstract class BookmarksEvent with _$BookmarksEvent {
  const factory BookmarksEvent.bookmarksInitialized() = BookmarksInitialized;

  const factory BookmarksEvent.bookmarksPortionRequested() = BookmarksPortionRequested;

  const factory BookmarksEvent.bookmarksUpdateRequested() = BookmarksUpdateRequested;

  const factory BookmarksEvent.bookmarksClearRequested() = BookmarksClearRequested;

  const factory BookmarksEvent.bookmarkRemoved({
    required Thread bookmark,
  }) = BookmarkRemoved;
}
