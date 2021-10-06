import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../bloc/board/board_bloc.dart';
import '../bloc/board/board_event.dart';
import '../bloc/board/board_state.dart';
import '../components/listcontroller/list_entity.dart';
import '../components/widgets/app_centered_circular_progress_indicator.dart';
import '../components/widgets/app_centered_text.dart';
import '../components/widgets/app_thread_card.dart';
import '../data/repositories/data_repository.dart';
import '../entities/board.dart';
import '../entities/thread.dart';
import '../extensions/build_context_extensions.dart';

class BoardScreen extends StatefulWidget {
  final Board board;

  const BoardScreen({
    Key? key,
    required this.board,
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
        dataRepository: context.read<DataRepository>(),
        board: widget.board,
      )..add(Initialized()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.board.toString()),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => _boardBloc.add(BoardRefreshed()),
        ),
        body: BlocBuilder<BoardBloc, BoardState>(
          builder: (context, state) {
            _boardBloc = context.read<BoardBloc>();
            return state.when(
              initial: () => const AppCenteredCircularProgressIndicator(),
              threadsLoadSuccess: (threads) {
                if (threads.isEmpty) {
                  return AppCenteredText(
                    text: context.localizations.messageBoardIsEmpty,
                  );
                }
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                  itemBuilder: (context, index) {
                    final item = _boardBloc.threads[index];
                    if (item is ListLoader) {
                      return SizedBox(
                        height: 172,
                        child: const AppCenteredCircularProgressIndicator(),
                      );
                    }
                    final thread = item.item as Thread;
                    return AppThreadCard(
                      key: ValueKey(thread.tim),
                      thread: thread,
                      tapNotifier: () => _boardBloc.addToHistory(thread),
                      availableActions: [
                        ThreadPopupMenuAction.openLink,
                        ThreadPopupMenuAction.copyLink,
                        ThreadPopupMenuAction.addToBookmarks,
                      ],
                    );
                  },
                  itemCount: _boardBloc.threads.length,
                  controller: _scrollController,
                );
              },
              newPortionLoading: () {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                  itemBuilder: (context, index) {
                    final item = _boardBloc.threads[index];
                    if (item is ListLoader) {
                      return SizedBox(
                        height: 172,
                        child: const AppCenteredCircularProgressIndicator(),
                      );
                    }
                    final thread = item.item as Thread;
                    return AppThreadCard(
                      key: ValueKey(thread.tim),
                      thread: thread,
                      tapNotifier: () => _boardBloc.addToHistory(thread),
                      availableActions: [
                        ThreadPopupMenuAction.openLink,
                        ThreadPopupMenuAction.copyLink,
                        ThreadPopupMenuAction.addToBookmarks,
                      ],
                    );
                  },
                  itemCount: _boardBloc.threads.length,
                  controller: _scrollController,
                );
              },
              threadsLoadError: () => const AppCenteredCircularProgressIndicator(),
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
        _boardBloc.add(ThreadPortionRequested());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
