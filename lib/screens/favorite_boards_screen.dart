import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favorite_boards/favorites_bloc.dart';
import '../components/routes/fchan_routes.dart';
import '../components/widgets/app_centered_circular_progress_indicator.dart';
import '../components/widgets/app_centered_text.dart';
import '../components/widgets/app_screen_frame.dart';
import '../data/repositories/data_repository.dart';
import '../entities/board.dart';
import '../extensions/build_context_extensions.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  FavoritesBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    return AppScreenFrame(
      title: context.localizations.titleHome,
      actions: [
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () async {
            await context.push(
              route: routeExploreBoards,
            );
            _bloc?.add(FavoritesEventBoardsUpdated());
          },
        ),
      ],
      body: BlocProvider<FavoritesBloc>(
        create: (context) => FavoritesBloc(
          dataRepository: RepositoryProvider.of<DataRepository>(context),
        ),
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            _bloc = context.read<FavoritesBloc>();
            if (state is FavoritesInitial) {
              return const AppCenteredCircularProgressIndicator();
            } else if (state is FavoritesLoadSuccess) {
              if (state.favorites.isEmpty) {
                return AppCenteredText(
                  text: context.localizations.messageFavoritesIsEmpty,
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) =>
                    _boardListItem(
                      context,
                      state.favorites[index],
                    ),
                itemCount: state.favorites.length,
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
  Widget _boardListItem(BuildContext context,
      Board board,) {
    return ListTile(
      title: Text(board.toString()),
      onTap: () =>
          Navigator.of(context).pushNamed(
            routeBoard,
            arguments: board,
          ),
    );
  }
}
