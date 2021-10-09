part of 'bookmarks_bloc.dart';

@immutable
abstract class BookmarksState {}

class BookmarksInitial extends BookmarksState {}

class BookmarksLoadSuccess extends BookmarksState {
  final List<Thread> bookmarks;

  BookmarksLoadSuccess({required this.bookmarks});
}

class BookmarksLoadError extends BookmarksState {}

class BookmarksClearInProgress extends BookmarksState {}
