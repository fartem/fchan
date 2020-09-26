import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/logic/routes/fchan_route.dart';
import 'package:fchan/logic/widgets/thread_list_item.dart';
import 'package:fchan/provider/bookmark_threads_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class BookmarksScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookmarksState();
}

class _BookmarksState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<BookmarkThreadsModel>(
        builder: (context, model, child) {
          return FutureBuilder<List<Thread>>(
            future: model.bookmarks(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.isEmpty) {
                  return Text(
                    context.fChanWords().boardsIsEmptyMessage,
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
                        () => context.push(
                          FChanRoute.threadScreen,
                          arguments: thread,
                        ),
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              } else if (snapshot.hasError) {
                return Text(
                  context.fChanWords().bookmarksLoadErrorMessage,
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
