import 'package:fchan/bloc/board/board_bloc.dart';
import 'package:fchan/bloc/board/board_event.dart';
import 'package:fchan/bloc/board/board_state.dart';
import 'package:fchan/components/widgets/app_centered_circular_progress_indicator.dart';
import 'package:fchan/components/widgets/app_centered_text.dart';
import 'package:fchan/components/widgets/app_list_loader.dart';
import 'package:fchan/components/widgets/app_thread_card.dart';
import 'package:fchan/data/repositories/api/history_repository.dart';
import 'package:fchan/data/repositories/api/threads_repository.dart';
import 'package:fchan/entities/board.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BoardScreen extends StatefulWidget {
  final Board board;

  const BoardScreen({
    required this.board,
    Key? key,
  }) : super(key: key);

  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  final ScrollController _scrollController = ScrollController();
  late BoardBloc _boardBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BoardBloc>(
      create: (context) => BoardBloc(
        historyRepository: context.read<HistoryRepository>(),
        threadsRepository: context.read<ThreadsRepository>(),
        board: widget.board,
      )..add(const BoardEventInitialized()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.board.toString()),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () => _boardBloc.add(const BoardEventRefreshed()),
        ),
        body: BlocBuilder<BoardBloc, BoardState>(
          builder: (context, state) {
            _boardBloc = context.read<BoardBloc>();
            return state.when(
              initial: () => const AppCenteredCircularProgressIndicator(),
              loadSuccess: (threads, isLastPage) {
                if (threads.isEmpty) {
                  return AppCenteredText(
                    text: context.localizations.messageBoardIsEmpty,
                  );
                }
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
                      tapNotifier: () => _boardBloc.addToHistory(thread),
                      availableActions: const [
                        ThreadPopupMenuAction.openLink,
                        ThreadPopupMenuAction.copyLink,
                        ThreadPopupMenuAction.addToBookmarks,
                      ],
                    );
                  },
                  itemCount: threads.length + (isLastPage ? 0 : 1),
                  controller: _scrollController,
                );
              },
              loadError: () => const AppCenteredCircularProgressIndicator(),
              isEmpty: () => AppCenteredText(
                text: context.localizations.messageBoardIsEmpty,
              ),
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
        _boardBloc.add(const BoardEventPortionRequested());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
