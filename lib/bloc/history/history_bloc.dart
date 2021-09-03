import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/data_repository.dart';
import '../../entities/thread.dart';
import '../../logic/listcontroller/list_entity.dart';
import '../../logic/listcontroller/list_portion_controller.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final DataRepository dataRepository;
  final threads = <Thread>[];

  late ListPortionController _listPortionController;

  HistoryBloc({required this.dataRepository}) : super(HistoryInitial()) {
    add(HistoryEventInitialized());
    _listPortionController = ListPortionController<Thread>(
      (entityPage) => dataRepository.history(entityPage),
    );
  }

  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    if (event is HistoryEventInitialized) {
      try {
        await _listPortionController.loadMore();
        yield HistoryThreadsLoadSuccess(
          threads: _listPortionController.items,
        );
      } on Exception {
        yield HistoryThreadsLoadError();
      }
    } else if (event is HistoryEventThreadPortionRequested) {
      await _listPortionController.loadMore();
      yield HistoryThreadsLoadSuccess(
        threads: _listPortionController.items,
      );
    }
  }

  Future<void> deleteFromHistory(Thread thread) async {
    dataRepository.removeThreadFromHistory(thread);
    threads.remove(thread);
  }
}
