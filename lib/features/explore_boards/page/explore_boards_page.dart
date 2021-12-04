import 'package:fchan/components/widgets/app_centered_circular_progress_indicator.dart';
import 'package:fchan/components/widgets/app_centered_text.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/features/explore_boards/stores/explore_boards_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ExploreBoardsPage extends StatefulWidget {
  const ExploreBoardsPage({Key? key}) : super(key: key);

  @override
  State<ExploreBoardsPage> createState() => _ExploreBoardsPageState();
}

class _ExploreBoardsPageState extends State<ExploreBoardsPage> {
  ExploreBoardsStore? _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store ??= Provider.of<ExploreBoardsStore>(context);
    _store!.init();
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
          if (_store!.isBusy) {
            return const AppCenteredCircularProgressIndicator();
          } else if (_store!.boards.isEmpty || _store!.hasError) {
            return AppCenteredText(
              text: context.localizations.messageBoardsIsEmpty,
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final board = _store!.boards.elementAt(index);
              return ListTile(
                title: Text(board.toString()),
                trailing: Icon(
                  (board.isFavorite ?? false) ? Icons.star : Icons.star_border,
                  color: Colors.grey,
                ),
                onTap: () async {
                  if (board.isFavorite ?? false) {
                    // context.read<ExploreBoardsBloc>().remoteBoardFromFavorites(board);
                  } else {
                    // context.read<ExploreBoardsBloc>().addBoardToFavorites(board);
                  }
                },
              );
            },
            itemCount: _store!.boards.length,
          );
        },
      ),
    );
  }
}
