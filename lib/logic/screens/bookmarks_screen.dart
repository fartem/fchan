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
  State<StatefulWidget> createState() => BookmarksState();
}

class BookmarksState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<BookmarkThreadsModel>(
        builder: (context, model, child) {
          if (model.bookmarks.isNotEmpty) {
            return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              staggeredTileBuilder: (index) => StaggeredTile.fit(2),
              itemBuilder: (context, index) {
                Thread thread = model.bookmarks[index];
                return ThreadListItem.forThread(
                    context,
                    thread,
                    context.fChanWords(),
                    () async {
                      Navigator.pushNamed(
                        context,
                        FChanRoute.threadScreen,
                        arguments: thread,
                      );
                    }
                );
              },
              itemCount: model.bookmarks.length,
            );
          }
          return Text(
              context.fChanWords().bookmarksIsEmptyMessage,
          );
        },
      ),
    );
  }
}
