import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../components/listcontroller/list_entity.dart';
import '../../components/listcontroller/list_portion_controller.dart';
import '../../data/repositories/data_repository.dart';
import '../../entities/thread.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final DataRepository dataRepository;

  late ListPortionController _listPortionController;

  List<ListEntity> get threads => _listPortionController.items;

  HistoryBloc({required this.dataRepository}) : super(HistoryInitial()) {
    add(HistoryEventInitialized());
    _listPortionController = ListPortionController<Thread>(
      portionProvider: (entityPage) => dataRepository.history(entityPage),
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

  Future<void> deleteFromHistory(Thread thread) async {
    dataRepository.removeThreadFromHistory(thread);
    threads.remove(thread);
  }
}
