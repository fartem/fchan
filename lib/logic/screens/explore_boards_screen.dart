import 'package:fchan/entities/board.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/logic/api/4chan_api.dart';
import 'package:fchan/logic/db/database.dart';
import 'package:fchan/provider/favorite_boards_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ExploreBoardsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExploreBoardsState();
}

class ExploreBoardsState extends State<ExploreBoardsScreen> {
  final ChanApi _chanApi = GetIt.I.get();

  final Database _database = GetIt.I.get();
  List<Board> _favoriteBoards;

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
      body: Center(
        child: FutureBuilder<List<Board>>(
          future: _database.favoriteBoards().then((favoriteBoards) {
            _favoriteBoards = favoriteBoards;
            return _chanApi.fetchBoards();
          }),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data.map((e) => _createBoardListItem(e)).toList(),
              );
            } else if (snapshot.hasError) {
              return Text('Boards fetch error!');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget _createBoardListItem(Board board) {
    final bool isFavorite = _favoriteBoards.contains(board);
    return ListTile(
      title: Text("/${board.board}/ - ${board.title}"),
      trailing: Icon(
        isFavorite ? Icons.star : Icons.star_border,
        color: isFavorite ? Colors.blue : Colors.grey,
      ),
      onTap: () async {
        if (isFavorite) {
          _favoriteBoards.remove(board);
          await _database.removeFromFavorites(board);
          context.read<FavoriteBoardsModel>().removeFavoriteBoard(board);
        } else {
          _favoriteBoards.add(board);
          await _database.addToFavorites(board);
          context.read<FavoriteBoardsModel>().addFavoriteBoard(board);
        }
        setState(() {});
      },
    );
  }
}
