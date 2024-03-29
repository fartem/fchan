import 'package:fchan/bloc/explore_boards/explore_boards_bloc.dart';
import 'package:fchan/bloc/explore_boards/explore_boards_state.dart';
import 'package:fchan/components/widgets/app_centered_circular_progress_indicator.dart';
import 'package:fchan/components/widgets/app_centered_text.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreBoardsScreen extends StatelessWidget {
  const ExploreBoardsScreen({Key? key}) : super(key: key);

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
            return state.when(
              exploreBoardsInitial: () => const AppCenteredCircularProgressIndicator(),
              exploreBoardsLoadSuccess: (boards) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final board = boards[index];
                    return ListTile(
                      title: Text(board.toString()),
                      trailing: Icon(
                        (board.isFavorite ?? false) ? Icons.star : Icons.star_border,
                        color: Colors.grey,
                      ),
                      onTap: () async {
                        if (board.isFavorite ?? false) {
                          context.read<ExploreBoardsBloc>().remoteBoardFromFavorites(board);
                        } else {
                          context.read<ExploreBoardsBloc>().addBoardToFavorites(board);
                        }
                      },
                    );
                  },
                  itemCount: boards.length,
                );
              },
              exploreBoardsLoadError: () => AppCenteredText(
                text: context.localizations.messageBoardsIsEmpty,
              ),
              exploreBoardsAreEmpty: () => AppCenteredText(
                text: context.localizations.messageBoardsIsEmpty,
              ),
            );
          },
        ),
      ),
    );
  }
}
