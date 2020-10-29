import 'package:clipboard/clipboard.dart';
import 'package:fchan/entities/thread.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/extensions/duration_extensions.dart';
import 'package:fchan/logic/routes/fchan_route.dart';
import 'package:fchan/logic/widgets/cached_network_image_with_loader.dart';
import 'package:fchan/logic/widgets/content_html_text_widget.dart';
import 'package:fchan/logic/words/fchan_words.dart';
import 'package:fchan/provider/history_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ThreadWidget extends StatelessWidget {
  final Thread _thread;
  final Function _threadClickAdditionalAction;

  ThreadWidget(
      this._thread,
      this._threadClickAdditionalAction,
  );

  @override
  Widget build(BuildContext context) {
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
                            _prepareThreadDateAndImageFormatInfo(_thread),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            _prepareThreadRepliesAndImagesInfo(
                              context.fChanWords(),
                              _thread,
                            ),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
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
                        case ThreadPopupMenuAction.openLink:
                          launch(_thread.threadUrl);
                          break;
                        case ThreadPopupMenuAction.copyLink:
                          await FlutterClipboard.copy(
                              _thread.threadUrl
                          );
                          break;
                        case ThreadPopupMenuAction.removeFromHistory:
                          context.read<HistoryModel>().removeFromHistory(_thread);
                          break;
                      }
                    },
                    child: Icon(
                      Icons.more_vert,
                    ),
                  ),
                ],
              ),
              if (_thread.thumbnailImageUrl != null)
                CachedNetworkImageWithLoader(
                  _thread.thumbnailImageUrl,
                  _thread.thumbnailImageWidth.toDouble(),
                  _thread.thumbnailImageHeight.toDouble(),
                ),
              if (_thread.sub != null)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    _thread.sub,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (_thread.com != null)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: ContentHtmlTextWidget(
                    _thread.com,
                  ),
                ),
            ],
          ),
          onTap: () {
            _threadClickAdditionalAction.call();
            context.push(
                FChanRoute.threadScreen,
                arguments: _thread
            );
          }
        ),
      ),
    );
  }

  String _prepareThreadDateAndImageFormatInfo(Thread thread) {
    String dateAtStart = thread.timeFromPublish.formatToTime();
    String imageFormat = thread.ext;
    return '$dateAtStart ${imageFormat == null ? '' : imageFormat}';
  }

  String _prepareThreadRepliesAndImagesInfo(
      FChanWords fChanWords,
      Thread thread
  ) {
    String replies = '${thread.replies == 0 ? '' : '${thread.replies} ${fChanWords.repliesTitle}'}';
    String images = '${thread.images == 0 ? '' : '${thread.images} ${fChanWords.imagesTitle}'}';
    return '$replies $images'.trim();
  }
}

enum ThreadPopupMenuAction {
  openLink,
  copyLink,
  removeFromHistory,
}
