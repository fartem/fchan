part of 'bookmarks_bloc.dart';

@immutable
abstract class BookmarksEvent {}

class BookmarksEventInitialized extends BookmarksEvent {}

class BookmarksEventPortionRequested extends BookmarksEvent {}

class BookmarksEventUpdateRequested extends BookmarksEvent {}

class BookmarksEventClearRequested extends BookmarksEvent {}

class BookmarksEventBookmarkRemoved extends BookmarksEvent {
  final Thread thread;

  BookmarksEventBookmarkRemoved({required this.thread});
}
