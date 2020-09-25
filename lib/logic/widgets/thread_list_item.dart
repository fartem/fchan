import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/duration_extensions.dart';
import 'package:fchan/logic/words/fchan_words.dart';
import 'package:fchan/provider/bookmark_threads_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ThreadListItem {
  static Widget forThread(
      BuildContext context,
      Thread thread,
      FChanWords fChanWords,
      Function() onTap
  ) {
    return Card(
      margin: const EdgeInsets.all(2.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
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
                            _prepareThreadDateAndImageFormatInfo(thread),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            _prepareThreadRepliesAndImagesInfo(
                                thread,
                                fChanWords
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<ThreadPopupMenuAction>(
                    itemBuilder: (context) => ThreadPopupMenuAction.values
                        .map((e) {
                          return PopupMenuItem<ThreadPopupMenuAction>(
                            value: e,
                            child: Text(e.toString()),
                          );
                        })
                        .toList(),
                    onSelected: (threadPopupMenuAction) async {
                      switch (threadPopupMenuAction) {
                        case ThreadPopupMenuAction.bookmark:
                          if (context.read<BookmarkThreadsModel>().bookmarks.contains(thread)) {
                            context.read<BookmarkThreadsModel>().removeThreadFromBookmarks(
                                thread
                            );
                          } else {
                            context.read<BookmarkThreadsModel>().addThreadToBookmarks(
                                thread
                            );
                          }
                          break;
                        case ThreadPopupMenuAction.openLink:
                          launch(thread.threadUrl);
                          break;
                        case ThreadPopupMenuAction.copyLink:
                          await FlutterClipboard.copy(
                            thread.threadUrl
                          );
                          break;
                      }
                    },
                  ),
                ],
              ),
              if (thread.imageUrl != null)
                CachedNetworkImage(
                  width: thread.imageWidth.toDouble(),
                  height: thread.imageHeight.toDouble(),
                  imageUrl: thread.imageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) {
                    return Center(
                        child: CircularProgressIndicator(),
                    );
                  },
                  errorWidget: (context, url, error) => Container(),
                ),
              if (thread.sub != null)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    thread.sub,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (thread.com != null)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Html(
                    data: thread.com,
                  ),
                ),
            ],
          ),
          onTap: () => onTap(),
        ),
      ),
    );
  }

  static String _prepareThreadDateAndImageFormatInfo(Thread thread) {
    String dateAtStart = thread.timeFromPublish.formatToTime();
    String imageFormat = thread.ext;
    return "$dateAtStart ${imageFormat == null ? "" : imageFormat}";
  }

  static String _prepareThreadRepliesAndImagesInfo(
      Thread thread,
      FChanWords fChanWords
  ) {
    String replies = "${thread.replies == 0 ? "" : "${thread.replies} ${fChanWords.repliesTitle}"}";
    String images = "${thread.images == 0 ? "" : "${thread.images} ${fChanWords.imagesTitle}"}";
    return "$replies $images".trim();
  }
}

enum ThreadPopupMenuAction {
  bookmark,
  openLink,
  copyLink,
}
