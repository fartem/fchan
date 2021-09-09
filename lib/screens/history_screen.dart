import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../bloc/history/history_bloc.dart';
import '../components/listcontroller/list_entity.dart';
import '../components/widgets/app_centered_circular_progress_indicator.dart';
import '../components/widgets/app_centered_text.dart';
import '../components/widgets/app_screen_frame.dart';
import '../components/widgets/app_thread_card.dart';
import '../data/repositories/data_repository.dart';
import '../entities/thread.dart';
import '../extensions/build_context_extensions.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final ScrollController _scrollController = ScrollController();
  late HistoryBloc _historyBloc;

  @override
  Widget build(BuildContext context) {
    return AppScreenFrame(
      title: context.localizations.titleHistory,
      actions: [
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            // TODO: implement
          },
        ),
      ],
      body: BlocProvider(
        create: (context) => HistoryBloc(
          dataRepository: context.read<DataRepository>(),
        ),
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            _historyBloc = context.read<HistoryBloc>();
            if (state is HistoryThreadsLoadSuccess) {
              if (_historyBloc.threads.isEmpty) {
                return AppCenteredText(
                  text: context.localizations.messageHistoryIsEmpty,
                );
              }
              return StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                itemBuilder: (context, index) {
                  final item = _historyBloc.threads[index];
                  if (item == listLoader) {
                    // TODO: set at center
                    return AppCenteredCircularProgressIndicator();
                  }
                  final thread = item.item as Thread;
                  return AppThreadCard(
                    key: ValueKey(thread.tim),
                    thread: thread,
                    tapAction: () {},
                    availableActions: ThreadPopupMenuAction.values,
                    deleteAction: () => _historyBloc.deleteFromHistory(thread),
                  );
                },
                itemCount: _historyBloc.threads.length,
              );
            }
            return AppCenteredCircularProgressIndicator();
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
        _historyBloc.add(HistoryEventThreadPortionRequested());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
