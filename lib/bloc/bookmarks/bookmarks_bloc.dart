import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/bloc/bookmarks/bookmarks_event.dart';
import 'package:fchan/bloc/bookmarks/bookmarks_state.dart';
import 'package:fchan/components/listcontroller/list_portion_controller.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/entities/thread.dart';
import 'package:flutter/cupertino.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  final DataRepository dataRepository;

  late ListPortionController<Thread> _listPortionController;

  BookmarksBloc({required this.dataRepository}) : super(const BookmarksInitial()) {
    add(const BookmarksInitialized());
    _listPortionController = ListPortionController<Thread>(
      portionProvider: dataRepository.bookmarks,
    );
  }

  @override
  Stream<BookmarksState> mapEventToState(
    BookmarksEvent event,
  ) async* {
    yield* event.when(
      bookmarksInitialized: _mapBookmarksEventInitialized,
      bookmarksPortionRequested: _mapBookmarksEventThreadPortionRequested,
      bookmarksUpdateRequested: _mapBookmarksEventUpdateRequested,
      bookmarksClearRequested: _mapBookmarksEventClearRequested,
      bookmarkRemoved: (thread) => _mapBookmarksEventBookmarkRemoved(
        thread: thread,
      ),
    );
  }

  Stream<BookmarksState> _mapBookmarksEventInitialized() async* {
    try {
      await _listPortionController.loadMore();
      if (_listPortionController.items.isNotEmpty) {
        yield BookmarksLoadSuccess(
          threads: List.unmodifiable(_listPortionController.items),
          isLastPage: _listPortionController.isLastPage,
        );
      } else {
        yield const BookmarksIsEmpty();
      }
    } on Exception {
      yield const BookmarksLoadError();
    }
  }

  Stream<BookmarksState> _mapBookmarksEventThreadPortionRequested() async* {
    await _listPortionController.loadMore();
    yield BookmarksLoadSuccess(
      threads: List.unmodifiable(_listPortionController.items),
      isLastPage: _listPortionController.isLastPage,
    );
  }

  Stream<BookmarksState> _mapBookmarksEventUpdateRequested() async* {
    yield BookmarksLoadSuccess(
      threads: List.unmodifiable(_listPortionController.items),
      isLastPage: _listPortionController.isLastPage,
    );
  }

  Stream<BookmarksState> _mapBookmarksEventClearRequested() async* {
    yield const BookmarksClearInProgress();
    await _listPortionController.reset();
    await dataRepository.localDataProvider.clearHistory();
    add(const BookmarksInitialized());
  }

  Stream<BookmarksState> _mapBookmarksEventBookmarkRemoved({
    required Thread thread,
  }) async* {
    _listPortionController.items.remove(thread);
    await dataRepository.removeThreadFromBookmarks(thread);
    add(const BookmarksUpdateRequested());
  }
}
