import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/bloc/history/history_event.dart';
import 'package:fchan/bloc/history/history_state.dart';
import 'package:fchan/components/listcontroller/list_portion_controller.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/entities/thread.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final DataRepository dataRepository;

  late ListPortionController<Thread> _listPortionController;

  HistoryBloc({required this.dataRepository}) : super(const HistoryStateInitial()) {
    add(const HistoryEventInitialized());
    _listPortionController = ListPortionController<Thread>(
      portionProvider: dataRepository.history,
    );
  }

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    yield* event.when(
      initialized: _mapHistoryEventInitializedToState,
      portionRequested: _mapHistoryEventThreadPortionRequestedToState,
      clearRequested: _mapHistoryEventClearRequestedToState,
    );
  }

  Stream<HistoryState> _mapHistoryEventInitializedToState() async* {
    try {
      await _listPortionController.loadMore();
      if (_listPortionController.items.isNotEmpty) {
        yield HistoryStateLoadSuccess(
          threads: List.unmodifiable(_listPortionController.items),
          isLastPage: _listPortionController.isLastPage,
        );
      } else {
        yield const HistoryStateHistoryIsEmpty();
      }
    } on Exception {
      yield const HistoryStateLoadError();
    }
  }

  Stream<HistoryState> _mapHistoryEventThreadPortionRequestedToState() async* {
    await _listPortionController.loadMore();
    yield HistoryStateLoadSuccess(
      threads: List.unmodifiable(_listPortionController.items),
      isLastPage: _listPortionController.isLastPage,
    );
  }

  Stream<HistoryState> _mapHistoryEventClearRequestedToState() async* {
    yield const HistoryStateClearInProgress();
    await _listPortionController.reset();
    await dataRepository.localDataProvider.clearHistory();
    add(const HistoryEventInitialized());
  }

  Future<void> deleteFromHistory(Thread thread) async {
    // TODO(fartem): update History
    await dataRepository.removeThreadFromHistory(thread);
  }
}
