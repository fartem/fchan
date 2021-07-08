import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../entities/thread.dart';
import '../../extensions/build_context_extensions.dart';
import '../../extensions/duration_extensions.dart';
import '../../logic/routes/fchan_routes.dart';
import '../../provider/thread_model.dart';
import '../words/fchan_words.dart';
import 'cached_network_image_with_loader.dart';
import 'content_html_text_widget.dart';

class ThreadWidget extends StatelessWidget {
  final Thread thread;
  final Function threadClickAdditionalAction;
  final List<ThreadPopupMenuAction> availableActions;
  final VoidCallback? deleteAction;

  ThreadWidget({
    required this.thread,
    required this.threadClickAdditionalAction,
    required this.availableActions,
    this.deleteAction,
  });

  @override
  Widget build(BuildContext context) {
    final fChanWords = context.read<FChanWords>();
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
                            _prepareThreadDateAndImageFormatInfo(thread),
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
                              fChanWords,
                              thread,
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
                    itemBuilder: (context) => availableActions.map((action) {
                      return PopupMenuItem<ThreadPopupMenuAction>(
                        value: action,
                        child: Text(
                          _wordForPopupActions(
                            fChanWords,
                            action,
                          ),
                        ),
                      );
                    }).toList(),
                    onSelected: (threadPopupMenuAction) async {
                      final threadModel = Provider.of<ThreadModel>(
                        context,
                        listen: false,
                      );
                      switch (threadPopupMenuAction) {
                        case ThreadPopupMenuAction.openLink:
                          launch(threadModel.threadLink(thread));
                          break;
                        case ThreadPopupMenuAction.copyLink:
                          await FlutterClipboard.copy(
                            threadModel.threadLink(thread),
                          );
                          break;
                        case ThreadPopupMenuAction.removeFromHistory:
                          deleteAction?.call();
                          break;
                      }
                    },
                    child: Icon(
                      Icons.more_vert,
                    ),
                  ),
                ],
              ),
              if (thread.thumbnail != null)
                CachedNetworkImageWithLoader(
                  url: thread.thumbnail!.url,
                  width: thread.thumbnail!.width.toDouble(),
                  height: thread.thumbnail!.height.toDouble(),
                ),
              if (thread.sub != null)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: ContentHtmlTextWidget(
                    text: thread.sub!,
                    bodyWeight: FontWeight.bold,
                  ),
                ),
              if (thread.com != null)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: ContentHtmlTextWidget(
                    text: thread.com!,
                    wrapText: true,
                  ),
                ),
            ],
          ),
        ),
        onTap: () {
          threadClickAdditionalAction.call();
          context.push(
            route: FChanRoutes.threadScreen,
            arguments: thread,
          );
        },
      ),
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

  String _wordForPopupActions(
    FChanWords fChanWords,
    ThreadPopupMenuAction action,
  ) {
    switch (action) {
      case ThreadPopupMenuAction.openLink:
        return fChanWords.threadActionOpenLink;
      case ThreadPopupMenuAction.copyLink:
        return fChanWords.threadActionCopyLink;
      case ThreadPopupMenuAction.removeFromHistory:
        return fChanWords.threadActionRemoveFromHistory;
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
