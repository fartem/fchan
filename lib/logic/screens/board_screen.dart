import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/logic/api/4chan_api.dart';
import 'package:fchan/logic/db/database.dart';
import 'package:fchan/logic/routes/fchan_route.dart';
import 'package:fchan/logic/widgets/thread_list_item.dart';
import 'package:fchan/provider/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class BoardScreen extends StatefulWidget {
  final Board _board;

  BoardScreen(this._board);

  @override
  State<StatefulWidget> createState() => BoardState(_board);
}

class BoardState extends State<BoardScreen> {
  final ChanApi _chanApi = GetIt.I.get();
  final Database _database = GetIt.I.get();

  final Board _board;

  BoardState(this._board);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _board.toString(),
        )
      ),
      body: Center(
        child: FutureBuilder<List<Thread>>(
          future: _chanApi.fetchCatalogPage(_board),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                itemBuilder: (context, index) {
                  Thread thread = snapshot.data[index];
                  return ThreadListItem.forThread(
                      context,
                      thread,
                      context.fChanWords(),
                      () async {
                        context.read<HistoryModel>().addToHistory(thread);
                        await _database.addToHistory(thread);
                        Navigator.pushNamed(
                            context,
                            FChanRoute.threadScreen,
                            arguments: thread,
                        );
                      }
                  );
                },
                itemCount: snapshot.data.length,
              );
            } else if (snapshot.hasError) {
              return Text('No impl');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
