import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../entities/thread.dart';
import '../../extensions/build_context_extensions.dart';
import '../../extensions/duration_extensions.dart';
import '../../logic/routes/fchan_route.dart';
import '../words/fchan_words.dart';
import 'cached_network_image_with_loader.dart';
import 'content_html_text_widget.dart';

class ThreadWidget extends StatelessWidget {
  final FChanWords _fChanWords = GetIt.I.get();

  final Thread _thread;
  final Function _threadClickAdditionalAction;
  final List<ThreadPopupMenuAction> _availableActions;
  final VoidCallback _deleteAction;

  ThreadWidget(
    this._thread,
    this._threadClickAdditionalAction,
    this._availableActions, [
    this._deleteAction,
  ]);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: InkWell(
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
                      itemBuilder: (context) => _availableActions.map((e) {
                        return PopupMenuItem<ThreadPopupMenuAction>(
                          value: e,
                          child: Text(_wordForPopupActions(e)),
                        );
                      }).toList(),
                      onSelected: (threadPopupMenuAction) async {
                        switch (threadPopupMenuAction) {
                          case ThreadPopupMenuAction.openLink:
                            launch(_thread.threadUrl);
                            break;
                          case ThreadPopupMenuAction.copyLink:
                            await FlutterClipboard.copy(_thread.threadUrl);
                            break;
                          case ThreadPopupMenuAction.removeFromHistory:
                            _deleteAction?.call();
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
                    child: ContentHtmlTextWidget(
                      _thread.sub,
                      bodyWeight: FontWeight.bold,
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
          ),
          onTap: () {
            _threadClickAdditionalAction.call();
            context.push(
              FChanRoute.threadScreen,
              arguments: _thread,
            );
          }),
    );
  }

  String _prepareThreadDateAndImageFormatInfo(Thread thread) {
    final dateAtStart = thread.timeFromPublish.formatToTime();
    final imageFormat = thread.ext;
    return '$dateAtStart ${imageFormat == null ? '' : imageFormat}';
  }

  String _prepareThreadRepliesAndImagesInfo(
    FChanWords fChanWords,
    Thread thread,
  ) {
    final replies = '${thread.replies == 0 ? '' : '${thread.replies} ${fChanWords.repliesTitle}'}';
    final images = '${thread.images == 0 ? '' : '${thread.images} ${fChanWords.imagesTitle}'}';
    return '$replies $images'.trim();
  }

  String _wordForPopupActions(ThreadPopupMenuAction action) {
    switch (action) {
      case ThreadPopupMenuAction.openLink:
        return _fChanWords.threadActionOpenLink;
      case ThreadPopupMenuAction.copyLink:
        return _fChanWords.threadActionCopyLink;
      case ThreadPopupMenuAction.removeFromHistory:
        return _fChanWords.threadActionRemoveFromHistory;
      default:
        return 'NO IMPL';
    }
  }
}

enum ThreadPopupMenuAction {
  openLink,
  copyLink,
  removeFromHistory,
}
