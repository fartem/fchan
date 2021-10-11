import 'package:fchan/entities/thread.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmarks_event.freezed.dart';

@freezed
abstract class BookmarksEvent with _$BookmarksEvent {
  const factory BookmarksEvent.initialized() = BookmarksEventInitialized;

  const factory BookmarksEvent.portionRequested() = BookmarksEventPortionRequested;

  const factory BookmarksEvent.updateRequested() = BookmarksEventUpdateRequested;

  const factory BookmarksEvent.clearRequested() = BookmarksEventClearRequested;

  const factory BookmarksEvent.bookmarkRemoved({
    required Thread bookmark,
  }) = BookmarksEventBookmarkRemoved;
}
