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

  HistoryBloc({required this.dataRepository}) : super(const HistoryInitial()) {
    add(const HistoryInitialized());
    _listPortionController = ListPortionController<Thread>(
      portionProvider: dataRepository.history,
    );
  }

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    yield* event.when(
      historyInitialized: _mapHistoryEventInitialized,
      historyPortionRequested: _mapHistoryEventThreadPortionRequested,
      historyClearRequested: _mapHistoryEventClearRequested,
    );
  }

  Stream<HistoryState> _mapHistoryEventInitialized() async* {
    try {
      await _listPortionController.loadMore();
      if (_listPortionController.items.isNotEmpty) {
        yield HistoryLoadSuccess(
          threads: List.unmodifiable(_listPortionController.items),
          isLastPage: _listPortionController.isLastPage,
        );
      } else {
        yield const HistoryIsEmpty();
      }
    } on Exception {
      yield const HistoryLoadError();
    }
  }

  Stream<HistoryState> _mapHistoryEventThreadPortionRequested() async* {
    await _listPortionController.loadMore();
    yield HistoryLoadSuccess(
      threads: List.unmodifiable(_listPortionController.items),
      isLastPage: _listPortionController.isLastPage,
    );
  }

  Stream<HistoryState> _mapHistoryEventClearRequested() async* {
    yield const HistoryClearInProgress();
    await _listPortionController.reset();
    await dataRepository.localDataProvider.clearHistory();
    add(const HistoryInitialized());
  }

  Future<void> deleteFromHistory(Thread thread) async {
    // TODO(fartem): update History
    await dataRepository.removeThreadFromHistory(thread);
  }
}
