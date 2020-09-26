import 'package:fchan/entities/board.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/logic/api/chan_api.dart';
import 'package:fchan/provider/favorite_boards_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ExploreBoardsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExploreBoardsState();
}

class _ExploreBoardsState extends State<ExploreBoardsScreen> {
  final ChanApi _chanApi = GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.fChanWords().exploreBoardsTitle,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Consumer<FavoriteBoardsModel>(
        builder: (context, model, child) {
          return Center(
            child: FutureBuilder<List<Board>>(
              // TODO: merge two lists
              future: model.favoriteBoards().then((value) => _chanApi.fetchBoards()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.isEmpty) {
                    return Text(
                      context.fChanWords().boardsIsEmptyMessage,
                    );
                  }
                  return ListView.builder(
                    itemBuilder: (context, index) => _createBoardListItem(snapshot.data[index]),
                    itemCount: snapshot.data.length,
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    context.fChanWords().boardsLoadErrorMessage,
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          );
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
      onTap: () {
        setState(() async {
          if (board.isFavorite) {
            await context.read<FavoriteBoardsModel>().removeFavoriteBoard(board);
          } else {
            await context.read<FavoriteBoardsModel>().addFavoriteBoard(board);
          }
        });
      },
    );
  }
}
