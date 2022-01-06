import 'package:fchan/components/widgets/app_centered_circular_progress_indicator.dart';
import 'package:fchan/components/widgets/app_centered_text.dart';
import 'package:fchan/components/widgets/app_list_loader.dart';
import 'package:fchan/components/widgets/app_thread_card.dart';
import 'package:fchan/data/repositories/api/threads_repository.dart';
import 'package:fchan/entities/board.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/features/board/store/board_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class BoardPage extends StatefulWidget {
  final Board board;

  const BoardPage({
    required this.board,
    Key? key,
  }) : super(key: key);

  @override
  _BoardPageState createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  final ScrollController _scrollController = ScrollController();
  BoardStore? _boardStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _boardStore ??= BoardStore(
      threadsRepository: Provider.of<ThreadsRepository>(context),
      board: widget.board,
    );
    _boardStore!.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.board.toString(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => _boardStore!.init(),
      ),
      body: Observer(
        builder: (_) {
          switch (_boardStore!.initFuture!.status) {
            case FutureStatus.pending:
              return const AppCenteredCircularProgressIndicator();
            case FutureStatus.rejected:
              return AppCenteredText(
                text: context.localizations.messageBoardIsEmpty,
              );
            case FutureStatus.fulfilled:
              final threads = _boardStore!.threads;
              if (threads.isEmpty) {
                return AppCenteredText(
                  text: context.localizations.messageBoardIsEmpty,
                );
              }
              return StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
                itemBuilder: (context, index) {
                  if (!_boardStore!.isLastPage && index == threads.length) {
                    return const AppListLoader();
                  }
                  final thread = threads[index];
                  return AppThreadCard(
                    key: ValueKey(thread.tim),
                    thread: thread,
                    // tapNotifier: () => _boardBloc.addToHistory(thread),
                    availableActions: const [
                      ThreadPopupMenuAction.openLink,
                      ThreadPopupMenuAction.copyLink,
                      ThreadPopupMenuAction.addToBookmarks,
                    ],
                  );
                },
                itemCount: threads.length + (_boardStore!.isLastPage ? 0 : 1),
                controller: _scrollController,
              );
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
        _boardStore?.requestThreadsPortion();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
