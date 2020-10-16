import 'package:fchan/entities/board.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/logic/routes/fchan_route.dart';
import 'package:fchan/logic/widgets/centered_circular_progress_indicator_widget.dart';
import 'package:fchan/logic/widgets/centered_text_widget.dart';
import 'package:fchan/provider/boards_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteBoardsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteBoardsState();
}

class _FavoriteBoardsState extends State<FavoriteBoardsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Board>>(
      future: context.watch<BoardsModel>().favoriteBoards(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.isEmpty) {
            return CenteredTextWidget(
              context.fChanWords().boardsIsEmptyMessage,
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => _boardListItem(context, snapshot.data[index]),
            itemCount: snapshot.data.length,
          );
        } else if (snapshot.hasError) {
          return CenteredTextWidget('');
        }
        return CenteredCircularProgressIndicatorWidget();
      },
    );
  }

  Widget _boardListItem(BuildContext context, Board board) {
    return ListTile(
      title: Text(board.toString()),
      onTap: () => context.push(
        FChanRoute.boardScreen,
        arguments: board,
      ),
    );
  }
}
