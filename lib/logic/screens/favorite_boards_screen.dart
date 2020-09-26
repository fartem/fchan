import 'package:fchan/entities/board.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/logic/routes/fchan_route.dart';
import 'package:fchan/provider/favorite_boards_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteBoardsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteBoardsState();
}

class _FavoriteBoardsState extends State<FavoriteBoardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<FavoriteBoardsModel>(
        builder: (context, model, child) {
          return FutureBuilder<List<Board>>(
            future: model.favoriteBoards(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.isEmpty) {
                  return Text(
                    context.fChanWords().boardsIsEmptyMessage,
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) => _boardListItem(context, snapshot.data[index]),
                  itemCount: snapshot.data.length,
                );
              } else if (snapshot.hasError) {
                return Text(
                  context.fChanWords().boardsLoadErrorMessage,
                );
              }
              return CircularProgressIndicator();
            },
          );
        },
      ),
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
