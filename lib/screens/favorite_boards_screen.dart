import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favorite_boards/favorite_boards_bloc.dart';
import '../components/routes/fchan_routes.dart';
import '../components/widgets/app_centered_circular_progress_indicator.dart';
import '../components/widgets/app_centered_text.dart';
import '../components/widgets/app_screen_frame.dart';
import '../data/repositories/data_repository.dart';
import '../entities/board.dart';
import '../extensions/build_context_extensions.dart';

class FavoriteBoardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScreenFrame(
      title: context.localizations.titleHome,
      actions: [
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () => context.push(
            route: FChanRoutes.routeExploreBoards,
          ),
        ),
      ],
      body: BlocBuilder<FavoriteBoardsBloc, FavoriteBoardsState>(
        bloc: FavoriteBoardsBloc(
          dataRepository: RepositoryProvider.of<DataRepository>(context),
        ),
        builder: (context, state) {
          if (state is FavoriteBoardsInitial) {
            return AppCenteredCircularProgressIndicator();
          } else if (state is FavoriteBoardsLoadSuccess) {
            if (state.favorites.isEmpty) {
              return AppCenteredText(
                text: context.localizations.messageFavoriteBoardsIsEmpty,
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) => _boardListItem(
                context,
                state.favorites[index],
              ),
              itemCount: state.favorites.length,
            );
          } else {
            return AppCenteredCircularProgressIndicator();
          }
        },
      ),
    );
  }

  // ignore: avoid-returning-widgets
  Widget _boardListItem(
    BuildContext context,
    Board board,
  ) {
    return ListTile(
      title: Text(board.toString()),
      onTap: () => Navigator.of(context).pushNamed(
        FChanRoutes.routeBoard,
        arguments: board,
      ),
    );
  }
}
