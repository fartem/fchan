import 'package:fchan/bloc/history/history_bloc.dart';
import 'package:fchan/bloc/history/history_event.dart';
import 'package:fchan/bloc/history/history_state.dart';
import 'package:fchan/components/widgets/app_centered_circular_progress_indicator.dart';
import 'package:fchan/components/widgets/app_centered_text.dart';
import 'package:fchan/components/widgets/app_list_loader.dart';
import 'package:fchan/components/widgets/app_screen_frame.dart';
import 'package:fchan/components/widgets/app_thread_card.dart';
import 'package:fchan/data/repositories/api/history_repository.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
          icon: const Icon(Icons.delete),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                context.localizations.messageHistoryClear,
              ),
              actions: [
                TextButton(
                  child: Text(
                    context.localizations.commonOk,
                  ),
                  onPressed: () {
                    _historyBloc.add(const HistoryEventClearRequested());
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: Text(
                    context.localizations.commonCancel,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ],
      body: BlocProvider(
        create: (context) => HistoryBloc(
          historyRepository: context.read<HistoryRepository>(),
        ),
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            _historyBloc = context.read<HistoryBloc>();
            return state.when(
              initial: () => const AppCenteredCircularProgressIndicator(),
              loadSuccess: (threads, isLastPage) {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
                  itemBuilder: (context, index) {
                    if (!isLastPage && index == threads.length) {
                      return const AppListLoader();
                    }
                    final thread = threads[index];
                    return AppThreadCard(
                      key: ValueKey(thread.tim),
                      thread: thread,
                      availableActions: const [
                        ThreadPopupMenuAction.removeFromHistory,
                      ],
                      // TODO(fartem): change event to `Update` or similar
                      actionNotifier: (action) => _historyBloc.add(
                        HistoryEventThreadRemovedFromHistory(
                          thread: thread,
                        ),
                      ),
                    );
                  },
                  itemCount: threads.length + (isLastPage ? 0 : 1),
                );
              },
              loadError: () => AppCenteredText(
                text: context.localizations.messageHistoryAreEmpty,
              ),
              historyIsEmpty: () => AppCenteredText(
                text: context.localizations.messageHistoryAreEmpty,
              ),
              clearInProgress: () => const AppCenteredCircularProgressIndicator(),
            );
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
        _historyBloc.add(const HistoryEventPortionRequested());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
