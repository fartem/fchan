import 'package:fchan/entities/post.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/extensions/duration_extensions.dart';
import 'package:fchan/logic/api/4chan_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';

class ThreadScreen extends StatefulWidget {
  final Thread _thread;

  ThreadScreen(this._thread);

  @override
  State<StatefulWidget> createState() => ThreadState(_thread);
}

class ThreadState extends State<ThreadScreen> {
  final ChanApi _chanApi = GetIt.I.get();

  final Thread _thread;

  ThreadState(this._thread);

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
              return ListView(
                children: snapshot.data
                    .map((e) => _postListItem(e))
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return Text(
                  context.fChanWords().postsInThreadIsEmptyMessage,
              );
            }
            return CircularProgressIndicator();
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
                              "${post.no} (${post.timeFromPublish.formatToTime()})"
                          ),
                      ),
                      if (post.imageUrl != null)
                        Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                                "${post.ext} (${post.imageWidth}x${post.imageHeight})"
                            ),
                        ),
                    ],
                  ),
                ),
                Icon(Icons.more_vert),
              ],
            ),
            if (post.imageUrl != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Image.network(
                  post.imageUrl,
                  width: post.imageThumbnailWidth.toDouble(),
                  height: post.imageThumbnailHeight.toDouble(),
                ),
              ),
              // Align(
              //   alignment: AlignmentDirectional.centerStart,
              //   child: CachedNetworkImage(
              //     width: post.imageThumbnailWidth.toDouble(),
              //     height: post.imageThumbnailHeight.toDouble(),
              //     imageUrl: post.imageUrl,
              //     progressIndicatorBuilder: (context, url, downloadProgress) {
              //       return Center(
              //           child: CircularProgressIndicator()
              //       );
              //     },
              //     errorWidget: (context, url, error) {
              //       return Icon(
              //         Icons.error,
              //       );
              //     },
              //   ),
              // ),
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
