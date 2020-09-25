import 'package:fchan/entities/board.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/logic/routes/fchan_route.dart';
import 'package:fchan/provider/favorite_boards_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteBoardsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoriteBoardsState();
}

class FavoriteBoardsState extends State<FavoriteBoardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<FavoriteBoardsModel>(
        builder: (context, model, child) {
          if (model.favoriteBoards.isEmpty) {
            return Text(
                context.fChanWords().boardsIsEmptyMessage,
            );
          }
          return ListView(
            children: model.favoriteBoards
                .map((e) => _boardListItem(context, e))
                .toList(),
          );
        },
      ),
    );
  }

  Widget _boardListItem(BuildContext context, Board board) {
    return ListTile(
      title: Text(
        "/${board.board}/ - ${board.title}"
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          FChanRoute.boardScreen,
          arguments: board,
        );
      },
    );
  }
}
