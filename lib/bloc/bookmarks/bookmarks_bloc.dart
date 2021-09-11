import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../components/listcontroller/list_entity.dart';
import '../../components/listcontroller/list_portion_controller.dart';
import '../../data/repositories/data_repository.dart';
import '../../entities/thread.dart';

part 'bookmarks_event.dart';
part 'bookmarks_state.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  final DataRepository dataRepository;

  late ListPortionController _listPortionController;

  List<ListEntity> get threads => _listPortionController.items;

  BookmarksBloc({required this.dataRepository}) : super(BookmarksInitial()) {
    add(BookmarksEventInitialized());
    _listPortionController = ListPortionController<Thread>(
      portionProvider: (entityPage) => dataRepository.bookmarks(entityPage),
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
    } else if (event is BookmarksEventClearRequested) {
      yield* _mapBookmarksEventClearRequested();
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

  Stream<BookmarksState> _mapBookmarksEventClearRequested() async* {
    yield BookmarksClearInProgress();
    _listPortionController.reset();
    await dataRepository.localDataProvider.clearHistory();
    add(BookmarksEventInitialized());
  }
}
