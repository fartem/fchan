import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/widgets/centered_circular_progress_indicator.dart';
import '../../data/repositories/data_repository.dart';
import '../../entities/board.dart';
import '../../logic/routes/fchan_routes.dart';
import 'favorites_bloc.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      bloc: FavoritesBloc(
        dataRepository: RepositoryProvider.of<DataRepository>(context),
      ),
      builder: (context, state) {
        if (state is FavoritesInitial) {
          return CenteredCircularProgressIndicator();
        } else if (state is FavoritesLoadSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) => _boardListItem(
              context,
              state.favorites[index],
            ),
            itemCount: state.favorites.length,
          );
        } else {
          return CenteredCircularProgressIndicator();
        }
      },
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
