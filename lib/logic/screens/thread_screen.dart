import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/extensions/duration_extensions.dart';
import 'package:fchan/logic/api/chan_api.dart';
import 'package:fchan/logic/gallery/gallery.dart';
import 'package:fchan/logic/widgets/cached_network_image_with_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';

class ThreadScreen extends StatefulWidget {
  final Thread _thread;

  ThreadScreen(this._thread);

  @override
  State<StatefulWidget> createState() => _ThreadState(_thread);
}

class _ThreadState extends State<ThreadScreen> {
  final ChanApi _chanApi = GetIt.I.get();
  final Gallery _gallery = GetIt.I.get();

  final ScrollController _scrollController = ScrollController();
  bool showFab = true;

  final Thread _thread;

  _ThreadState(this._thread);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      showFab = _scrollController.position.userScrollDirection != ScrollDirection.reverse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _thread.toString(),
        ),
        actions: [
          IconButton(
            icon: Icon(
                Icons.more_vert
            ),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: _chanApi.fetchPosts(_thread.board, _thread),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.isEmpty) {
                return Text(
                  context.fChanWords().boardsIsEmptyMessage,
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) => _postListItem(snapshot.data[index]),
                itemCount: snapshot.data.length,
                controller: _scrollController,
              );
            } else if (snapshot.hasError) {
              return Text(
                  context.fChanWords().postsLoadErrorMessage,
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: showFab,
        child: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {

          },
        ),
      ),
    );
  }

  Widget _postListItem(Post post) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                              "${post.no} (${post.timeFromPublish.formatToTime()})",
                          ),
                      ),
                      if (post.imageUrl != null)
                        Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                                "${post.ext} (${post.imageWidth}x${post.imageHeight})",
                            ),
                        ),
                    ],
                  ),
                ),
                // TODO: add post without image handling
                PopupMenuButton<PostPopupMenuAction>(
                  itemBuilder: (context) => PostPopupMenuAction.values
                      .map((e) {
                        return PopupMenuItem<PostPopupMenuAction>(
                          value: e,
                          child: Text(e.toString()),
                        );
                      })
                      .toList(),
                  onSelected: (postPopupMenuAction) async {
                    switch (postPopupMenuAction) {
                      case PostPopupMenuAction.saveImageToGallery:

                        break;
                    }
                  },
                ),
              ],
            ),
            if (post.imageUrl != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: CachedNetworkImageWithLoader(
                  post.imageUrl,
                  post.imageThumbnailWidth.toDouble(),
                  post.imageThumbnailHeight.toDouble(),
                ),
              ),
            if (post.sub != null)
              Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Html(
                      data: post.sub,
                  ),
              ),
            if (post.com != null)
              Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Html(
                      data: post.com,
                  ),
              ),
          ],
        ),
      ),
    );
  }
}

enum PostPopupMenuAction {
  saveImageToGallery,
}
