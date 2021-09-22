import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/explore_boards/explore_boards_bloc.dart';
import '../components/widgets/app_centered_circular_progress_indicator.dart';
import '../components/widgets/app_centered_text.dart';
import '../data/repositories/data_repository.dart';
import '../entities/board.dart';
import '../extensions/build_context_extensions.dart';

class ExploreBoardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExploreBoardsBloc>(
      create: (context) => ExploreBoardsBloc(
        dataRepository: RepositoryProvider.of<DataRepository>(context),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.localizations.titleExploreBoards,
          ),
        ),
        body: BlocBuilder<ExploreBoardsBloc, ExploreBoardsState>(
          builder: (context, state) {
            if (state is ExploreBoardsLoadSuccess) {
              if (state.boards.isEmpty) {
                return AppCenteredText(
                  text: context.localizations.messageBoardsIsEmpty,
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) => _createBoardListItem(
                  state.boards[index],
                  context.read<ExploreBoardsBloc>(),
                ),
                itemCount: state.boards.length,
              );
            } else {
              return const AppCenteredCircularProgressIndicator();
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
