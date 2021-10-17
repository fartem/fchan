import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/bloc/bookmarks/bookmarks_event.dart';
import 'package:fchan/bloc/bookmarks/bookmarks_state.dart';
import 'package:fchan/components/listcontroller/list_portion_controller.dart';
import 'package:fchan/data/repositories/api/bookmarks_repository.dart';
import 'package:fchan/entities/thread.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  final BookmarksRepository bookmarksRepository;

  late ListPortionController<Thread> _listPortionController;

  BookmarksBloc({required this.bookmarksRepository}) : super(const BookmarksStateInitial()) {
    add(const BookmarksEventInitialized());
    _listPortionController = ListPortionController<Thread>(
      portionProvider: bookmarksRepository.bookmarks,
    );
  }

  @override
  Stream<BookmarksState> mapEventToState(
    BookmarksEvent event,
  ) async* {
    yield* event.when(
      initialized: _mapBookmarksEventInitializedToState,
      portionRequested: _mapBookmarksEventThreadPortionRequestedToState,
      updateRequested: _mapBookmarksEventUpdateRequestedToState,
      bookmarkRemoved: (thread) => _mapBookmarksEventBookmarkRemovedToState(
        thread: thread,
      ),
    );
  }

  Stream<BookmarksState> _mapBookmarksEventInitializedToState() async* {
    try {
      await _listPortionController.loadMore();
      if (_listPortionController.items.isNotEmpty) {
        yield BookmarksStateLoadSuccess(
          threads: List.unmodifiable(_listPortionController.items),
          isLastPage: _listPortionController.isLastPage,
        );
      } else {
        yield const BookmarksStateBookmarksListIsEmpty();
      }
    } on Exception {
      yield const BookmarksStateLoadError();
    }
  }

  Stream<BookmarksState> _mapBookmarksEventThreadPortionRequestedToState() async* {
    await _listPortionController.loadMore();
    yield BookmarksStateLoadSuccess(
      threads: List.unmodifiable(_listPortionController.items),
      isLastPage: _listPortionController.isLastPage,
    );
  }

  Stream<BookmarksState> _mapBookmarksEventUpdateRequestedToState() async* {
    if (_listPortionController.items.isNotEmpty) {
      yield BookmarksStateLoadSuccess(
        threads: List.unmodifiable(_listPortionController.items),
        isLastPage: _listPortionController.isLastPage,
      );
    } else {
      yield const BookmarksStateBookmarksListIsEmpty();
    }
  }

  Stream<BookmarksState> _mapBookmarksEventBookmarkRemovedToState({
    required Thread thread,
  }) async* {
    _listPortionController.items.remove(thread);
    await bookmarksRepository.removeThreadFromBookmarks(thread);
    add(const BookmarksEventUpdateRequested());
  }
}
