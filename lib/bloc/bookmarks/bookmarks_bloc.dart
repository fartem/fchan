import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/components/listcontroller/list_portion_controller.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/entities/thread.dart';
import 'package:meta/meta.dart';

part 'bookmarks_event.dart';

part 'bookmarks_state.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  final DataRepository dataRepository;

  late ListPortionController<Thread> _listPortionController;

  List<Thread> get threads => _listPortionController.items;

  BookmarksBloc({required this.dataRepository}) : super(BookmarksInitial()) {
    add(BookmarksEventInitialized());
    _listPortionController = ListPortionController<Thread>(
      portionProvider: dataRepository.bookmarks,
    );
  }

  @override
  Stream<BookmarksState> mapEventToState(
    BookmarksEvent event,
  ) async* {
    if (event is BookmarksEventInitialized) {
      yield* _mapBookmarksEventInitialized();
    } else if (event is BookmarksEventPortionRequested) {
      yield* _mapBookmarksEventThreadPortionRequested();
    } else if (event is BookmarksEventUpdateRequested) {
      yield* _mapBookmarksEventUpdateRequested();
    } else if (event is BookmarksEventClearRequested) {
      yield* _mapBookmarksEventClearRequested();
    } else if (event is BookmarksEventBookmarkRemoved) {
      yield* _mapBookmarksEventBookmarkRemoved(event: event);
    }
  }

  Stream<BookmarksState> _mapBookmarksEventInitialized() async* {
    try {
      await _listPortionController.loadMore();
      yield BookmarksLoadSuccess(
        bookmarks: _listPortionController.items,
      );
    } on Exception {
      yield BookmarksLoadError();
    }
  }

  Stream<BookmarksState> _mapBookmarksEventThreadPortionRequested() async* {
    await _listPortionController.loadMore();
    yield BookmarksLoadSuccess(
      bookmarks: _listPortionController.items,
    );
  }

  Stream<BookmarksState> _mapBookmarksEventUpdateRequested() async* {
    yield BookmarksLoadSuccess(
      bookmarks: _listPortionController.items,
    );
  }

  Stream<BookmarksState> _mapBookmarksEventClearRequested() async* {
    yield BookmarksClearInProgress();
    await _listPortionController.reset();
    await dataRepository.localDataProvider.clearHistory();
    add(BookmarksEventInitialized());
  }

  Stream<BookmarksState> _mapBookmarksEventBookmarkRemoved({
    required BookmarksEventBookmarkRemoved event,
  }) async* {
    _listPortionController.items.remove(event.thread);
    await dataRepository.removeThreadFromBookmarks(event.thread);
    add(BookmarksEventUpdateRequested());
  }
}
