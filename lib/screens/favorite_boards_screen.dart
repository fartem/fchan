import 'package:fchan/bloc/favorite_boards/favorites_bloc.dart';
import 'package:fchan/components/routes/fchan_routes.dart';
import 'package:fchan/components/widgets/app_centered_circular_progress_indicator.dart';
import 'package:fchan/components/widgets/app_centered_text.dart';
import 'package:fchan/components/widgets/app_screen_frame.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

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
          icon: const Icon(Icons.edit),
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
                itemBuilder: (context, index) {
                  final board = state.favorites[index];
                  return ListTile(
                    title: Text(board.toString()),
                    onTap: () => Navigator.of(context).pushNamed(
                      routeBoard,
                      arguments: board,
                    ),
                  );
                },
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
}
