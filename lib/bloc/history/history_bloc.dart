import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fchan/components/listcontroller/list_entity.dart';
import 'package:fchan/components/listcontroller/list_portion_controller.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/entities/thread.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final DataRepository dataRepository;

  late ListPortionController _listPortionController;

  List<ListEntity> get threads => _listPortionController.items;

  HistoryBloc({required this.dataRepository}) : super(HistoryInitial()) {
    add(HistoryEventInitialized());
    _listPortionController = ListPortionController<Thread>(
      portionProvider: dataRepository.history,
    );
  }

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    if (event is HistoryEventInitialized) {
      yield* _mapHistoryEventInitialized();
    } else if (event is HistoryEventThreadPortionRequested) {
      yield* _mapHistoryEventThreadPortionRequested();
    } else if (event is HistoryEventClearRequested) {
      yield* _mapHistoryEventClearRequested();
    }
  }

  Stream<HistoryState> _mapHistoryEventInitialized() async* {
    try {
      await _listPortionController.loadMore();
      yield HistoryThreadsLoadSuccess(
        threads: _listPortionController.items,
      );
    } on Exception {
      yield HistoryThreadsLoadError();
    }
  }

  Stream<HistoryState> _mapHistoryEventThreadPortionRequested() async* {
    await _listPortionController.loadMore();
    yield HistoryThreadsLoadSuccess(
      threads: _listPortionController.items,
    );
  }

  Stream<HistoryState> _mapHistoryEventClearRequested() async* {
    yield HistoryClearInProgress();
    await _listPortionController.reset();
    await dataRepository.localDataProvider.clearHistory();
    add(HistoryEventInitialized());
  }

  Future<void> deleteFromHistory(Thread thread) async {
    await dataRepository.removeThreadFromHistory(thread);
    threads.remove(thread);
  }
}
