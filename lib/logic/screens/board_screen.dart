import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/logic/api/chan_api.dart';
import 'package:fchan/logic/widgets/thread_widget.dart';
import 'package:fchan/provider/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class BoardScreen extends StatefulWidget {
  final Board _board;

  BoardScreen(this._board);

  @override
  State<StatefulWidget> createState() => _BoardState(_board);
}

class _BoardState extends State<BoardScreen> {
  final ChanApi _chanApi = GetIt.I.get();

  final ScrollController _scrollController = ScrollController();
  bool showFab = true;

  final Board _board;

  _BoardState(this._board);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        showFab = _scrollController.position.userScrollDirection != ScrollDirection.reverse;
      });
    });
  }

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
                itemBuilder: (context, index) => ThreadWidget(
                  snapshot.data[index],
                  () async {
                    // TODO: extract thread from snapshot before save to History
                    await context.read<HistoryModel>().addToHistory(snapshot.data[index]);
                  },
                ),
                itemCount: snapshot.data.length,
                controller: _scrollController,
              );
            } else if (snapshot.hasError) {
              return Text(
                context.fChanWords().boardsLoadErrorMessage,
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: showFab,
        child: FloatingActionButton(
          child: Icon(
            Icons.refresh,
          ),
          onPressed: () {

          },
        ),
      ),
    );
  }
}
