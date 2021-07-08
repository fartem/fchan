import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/widgets/centered_circular_progress_indicator_widget.dart';
import '../../components/widgets/centered_text_widget.dart';
import '../../components/words/fchan_words.dart';
import '../../entities/board.dart';
import '../../extensions/build_context_extensions.dart';
import '../../provider/favorite_boards_model.dart';
import '../routes/fchan_routes.dart';

class FavoriteBoardsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteBoardsState();
}

class _FavoriteBoardsState extends State<FavoriteBoardsScreen> {
  @override
  Widget build(BuildContext context) {
    final fChanWords = context.read<FChanWords>();
    return Consumer<FavoriteBoardsModel>(builder: (context, model, child) {
      return FutureBuilder<List<Board>>(
        future: model.favoriteBoards(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return CenteredTextWidget(
                text: fChanWords.boardsIsEmptyMessage,
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) => _boardListItem(
                context,
                snapshot.data![index],
              ),
              itemCount: snapshot.data!.length,
            );
          } else if (snapshot.hasError) {
            return CenteredTextWidget(
              text: '',
            );
          }
          return CenteredCircularProgressIndicatorWidget();
        },
      );
    });
  }

  // ignore: avoid-returning-widgets
  Widget _boardListItem(
    BuildContext context,
    Board board,
  ) {
    return ListTile(
      title: Text(board.toString()),
      onTap: () => context.push(
        route: FChanRoutes.boardScreen,
        arguments: board,
      ),
    );
  }
}
