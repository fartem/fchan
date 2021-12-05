import 'package:fchan/components/widgets/app_centered_circular_progress_indicator.dart';
import 'package:fchan/components/widgets/app_centered_text.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/features/explore_boards/stores/explore_boards_store.dart';
import 'package:fchan/features/favorites/stores/favorites_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class ExploreBoardsPage extends StatefulWidget {
  const ExploreBoardsPage({Key? key}) : super(key: key);

  @override
  State<ExploreBoardsPage> createState() => _ExploreBoardsPageState();
}

class _ExploreBoardsPageState extends State<ExploreBoardsPage> {
  ExploreBoardsStore? _exploreBoardsStore;
  FavoritesStore? _favoritesStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _exploreBoardsStore ??= Provider.of<ExploreBoardsStore>(context);
    _exploreBoardsStore!.init();
    _favoritesStore ??= Provider.of<FavoritesStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localizations.titleExploreBoards,
        ),
      ),
      body: Observer(
        builder: (_) {
          switch (_exploreBoardsStore!.initFuture!.status) {
            case FutureStatus.pending:
              return const AppCenteredCircularProgressIndicator();
            case FutureStatus.rejected:
              return AppCenteredText(
                text: context.localizations.messageBoardsIsEmpty,
              );
            case FutureStatus.fulfilled:
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Observer(
                    builder: (_) {
                      final board = _exploreBoardsStore!.boards.elementAt(index);
                      final isFavorite = _favoritesStore!.favorites.contains(board);
                      return ListTile(
                        title: Text(board.toString()),
                        trailing: Icon(
                          isFavorite ? Icons.star : Icons.star_border,
                          color: Colors.grey,
                        ),
                        onTap: () async {
                          if (isFavorite) {
                            await _favoritesStore!.removeFromFavorites(board);
                          } else {
                            await _favoritesStore!.addToFavorites(board);
                          }
                        },
                      );
                    },
                  );
                },
                itemCount: _exploreBoardsStore!.boards.length,
              );
          }
        },
      ),
    );
  }
}
