part of 'bookmarks_bloc.dart';

@immutable
abstract class BookmarksEvent {}

class BookmarksEventInitialized extends BookmarksEvent {}

class BookmarksEventPortionRequested extends BookmarksEvent {}

class BookmarksEventClearRequested extends BookmarksEvent {}
