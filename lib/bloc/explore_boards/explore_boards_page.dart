import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/widgets/centered_circular_progress_indicator_widget.dart';
import '../../components/words/fchan_words.dart';
import '../../data/repositories/data_repository.dart';
import '../../entities/board.dart';
import 'explore_boards_bloc.dart';

class ExploreBoardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fChanWords = context.read<FChanWords>();
    return BlocProvider<ExploreBoardsBloc>(
      create: (context) => ExploreBoardsBloc(
        dataRepository: RepositoryProvider.of<DataRepository>(context),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            fChanWords.exploreBoardsTitle,
          ),
        ),
        body: BlocBuilder<ExploreBoardsBloc, ExploreBoardsState>(
          builder: (context, state) {
            if (state is ExploreBoardsLoadSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) => _createBoardListItem(
                  state.boards[index],
                  context.read<ExploreBoardsBloc>(),
                ),
                itemCount: state.boards.length,
              );
            } else {
              return CenteredCircularProgressIndicatorWidget();
            }
          },
        ),
      ),
    );
  }

  // ignore: avoid-returning-widgets
  Widget _createBoardListItem(
    Board board,
    ExploreBoardsBloc bloc,
  ) {
    return ListTile(
      title: Text(board.toString()),
      trailing: Icon(
        (board.isFavorite ?? false) ? Icons.star : Icons.star_border,
        color: Colors.grey,
      ),
      onTap: () async {
        if (board.isFavorite ?? false) {
          bloc.remoteBoardFromFavorites(board);
        } else {
          bloc.addBoardToFavorites(board);
        }
      },
    );
  }
}
