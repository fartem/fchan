import 'package:fchan/entities/board.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/logic/widgets/centered_circular_progress_indicator_widget.dart';
import 'package:fchan/logic/widgets/centered_text_widget.dart';
import 'package:fchan/provider/boards_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreBoardsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExploreBoardsState();
}

class _ExploreBoardsState extends State<ExploreBoardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.fChanWords().exploreBoardsTitle,
        ),
      ),
      body: FutureBuilder<List<Board>>(
        future: context.watch<BoardsModel>().boards(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isEmpty) {
              return CenteredTextWidget(
                context.fChanWords().boardsIsEmptyMessage,
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) => _createBoardListItem(snapshot.data[index]),
              itemCount: snapshot.data.length,
            );
          } else if (snapshot.hasError) {
            return CenteredTextWidget(
              context.fChanWords().commonErrorMessage,
            );
          }
          return CenteredCircularProgressIndicatorWidget();
        },
      ),
    );
  }

  Widget _createBoardListItem(Board board) {
    return ListTile(
      title: Text(board.toString()),
      trailing: Icon(
        board.isFavorite ? Icons.star : Icons.star_border,
        color: board.isFavorite ? Colors.blue : Colors.grey,
      ),
      onTap: () async {
        if (!board.isFavorite) {
          context.read<BoardsModel>().addFavoriteBoard(board);
        } else {
          context.read<BoardsModel>().removeFavoriteBoard(board);
        }
      },
    );
  }
}
