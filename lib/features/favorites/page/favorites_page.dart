import 'package:fchan/components/routes/fchan_routes.dart';
import 'package:fchan/components/widgets/app_centered_circular_progress_indicator.dart';
import 'package:fchan/components/widgets/app_centered_text.dart';
import 'package:fchan/components/widgets/app_screen_frame.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/features/favorites/stores/favorites_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  FavoritesStore? _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store ??= Provider.of<FavoritesStore>(context);
    _store!.load();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreenFrame(
      title: context.localizations.titleHome,
      actions: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => context.push(
            route: routeExploreBoards,
          ),
        ),
      ],
      body: Observer(
        builder: (_) {
          if (_store!.isBusy) {
            return const AppCenteredCircularProgressIndicator();
          } else if (_store!.favorites.isEmpty || _store!.hasError) {
            return AppCenteredText(
              text: context.localizations.messageFavoritesIsEmpty,
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final board = _store!.favorites.elementAt(index);
              return ListTile(
                title: Text(board.toString()),
                onTap: () => Navigator.of(context).pushNamed(
                  routeBoard,
                  arguments: board,
                ),
              );
            },
            itemCount: _store!.favorites.length,
          );
        },
      ),
    );
  }
}
