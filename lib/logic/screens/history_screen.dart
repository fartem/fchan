import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/logic/widgets/thread_list_item.dart';
import 'package:fchan/provider/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryState();
}

class _HistoryState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<HistoryModel>(
        builder: (context, model, child) {
          return FutureBuilder<List<Thread>>(
            future: model.historyThreads(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.isEmpty) {
                  return Text(
                    context.fChanWords().historyIsEmptyMessage,
                  );
                }
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                  itemBuilder: (context, index) {
                    Thread thread = snapshot.data[index];
                    return ThreadListItem.forThread(
                        context,
                        thread,
                        context.fChanWords(),
                        () => null,
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              } else if (snapshot.hasError) {
                return Text(
                  context.fChanWords().historyLoadErrorMessage,
                );
              }
              return CircularProgressIndicator();
            },
          );
        },
      ),
    );
  }
}
