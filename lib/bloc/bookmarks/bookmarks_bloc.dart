import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/bloc/bookmarks/bookmarks_event.dart';
import 'package:fchan/bloc/bookmarks/bookmarks_state.dart';
import 'package:fchan/components/listcontroller/list_portion_controller.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/entities/thread.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  final DataRepository dataRepository;

  late ListPortionController<Thread> _listPortionController;

  BookmarksBloc({required this.dataRepository}) : super(const BookmarksStateInitial()) {
    add(const BookmarksEventInitialized());
    _listPortionController = ListPortionController<Thread>(
      portionProvider: dataRepository.bookmarks,
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
      clearRequested: _mapBookmarksEventClearRequestedToState,
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

  Stream<BookmarksState> _mapBookmarksEventClearRequestedToState() async* {
    yield const BookmarksStateClearInProgress();
    await _listPortionController.reset();
    await dataRepository.localDataProvider.clearHistory();
    add(const BookmarksEventInitialized());
  }

  Stream<BookmarksState> _mapBookmarksEventBookmarkRemovedToState({
    required Thread thread,
  }) async* {
    _listPortionController.items.remove(thread);
    await dataRepository.removeThreadFromBookmarks(thread);
    add(const BookmarksEventUpdateRequested());
  }
}
