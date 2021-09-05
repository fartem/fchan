import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../components/widgets/app_centered_circular_progress_indicator.dart';
import '../../components/widgets/app_centered_text.dart';
import '../../components/widgets/app_thread_card.dart';
import '../../data/repositories/data_repository.dart';
import '../../entities/thread.dart';
import '../../extensions/build_context_extensions.dart';
import '../../logic/listcontroller/list_entity.dart';
import 'history_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final ScrollController _scrollController = ScrollController();
  late HistoryBloc _historyBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
                final thread = item as Thread;
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
