import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../components/widgets/centered_circular_progress_indicator.dart';
import '../../components/widgets/thread_card.dart';
import '../../data/repositories/data_repository.dart';
import '../../entities/board.dart';
import '../../logic/listcontroller/list_entity.dart';
import 'board_bloc.dart';

class BoardPage extends StatefulWidget {
  final Board board;

  const BoardPage({
    Key? key,
    required this.board,
  }) : super(key: key);

  @override
  _BoardPageState createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  final ScrollController _scrollController = ScrollController();
  late BoardBloc _boardBloc;
  bool showFab = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
        _boardBloc.add(BoardEventThreadPortionRequested());
      } else {
        setState(() {
          showFab = _scrollController.position.userScrollDirection != ScrollDirection.reverse;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BoardBloc>(
      create: (context) => BoardBloc(
        dataRepository: context.read<DataRepository>(),
        board: widget.board,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.board.toString(),
          ),
        ),
        floatingActionButton: Visibility(
          visible: showFab,
          child: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () => _boardBloc.add(BoardEventBoardRefreshed()),
          ),
        ),
        body: BlocBuilder<BoardBloc, BoardState>(
          builder: (context, state) {
            _boardBloc = context.read<BoardBloc>();
            if (state is BoardThreadsLoadSuccess) {
              return StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                itemBuilder: (context, index) {
                  final item = state.threads[index];
                  if (item == listLoader) {
                    // TODO: set at center
                    return CenteredCircularProgressIndicator();
                  }
                  final thread = item.item;
                  return ThreadCard(
                    thread: thread,
                    additionalAction: () {},
                    availableActions: [
                      ThreadPopupMenuAction.openLink,
                      ThreadPopupMenuAction.copyLink,
                    ],
                  );
                },
                itemCount: state.threads.length,
                controller: _scrollController,
              );
            }
            return CenteredCircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
