import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/repositories/data_repository.dart';
import '../../entities/thread.dart';
import '../../extensions/build_context_extensions.dart';
import '../../extensions/duration_extensions.dart';
import '../../logic/routes/fchan_routes.dart';
import 'cached_network_image_with_loader.dart';
import 'content_html_text.dart';

class ThreadCard extends StatelessWidget {
  final Thread thread;
  final Function tapAction;
  final List<ThreadPopupMenuAction> availableActions;
  final VoidCallback? deleteAction;

  ThreadCard({
    required this.thread,
    required this.tapAction,
    required this.availableActions,
    this.deleteAction,
  });

  @override
  Widget build(BuildContext context) {
    final dataRepository = context.read<DataRepository>();
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
                              context.localizations(),
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
                            context.localizations(),
                            action,
                          ),
                        ),
                      );
                    }).toList(),
                    onSelected: (threadPopupMenuAction) async {
                      switch (threadPopupMenuAction) {
                        case ThreadPopupMenuAction.openLink:
                          launch(thread.link);
                          break;
                        case ThreadPopupMenuAction.copyLink:
                          await FlutterClipboard.copy(thread.link);
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
              if (thread.hasImage())
                CachedNetworkImageWithLoader(
                  url: thread.thumbnailUrl(dataRepository.baseUrlImage())!,
                  width: thread.thumbnailWidth!.toDouble(),
                  height: thread.thumbnailHeight!.toDouble(),
                ),
              if (thread.sub != null)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: ContentHtmlText(
                    text: thread.sub!,
                    bodyWeight: FontWeight.bold,
                  ),
                ),
              if (thread.com != null)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: ContentHtmlText(
                    text: thread.com!,
                    wrapText: true,
                  ),
                ),
            ],
          ),
        ),
        onTap: () {
          tapAction.call();
          context.push(
            route: FChanRoutes.routeThread,
            arguments: thread,
          );
        },
      ),
    );
  }

  String _prepareThreadDateAndImageFormatInfo(Thread thread) {
    final dateAtStart = thread.time.formatToTime();
    final imageFormat = thread.ext;
    return '$dateAtStart ${imageFormat == null ? '' : imageFormat}';
  }

  String _prepareThreadRepliesAndImagesInfo(
    AppLocalizations localizations,
    Thread thread,
  ) {
    final replies = '${thread.replies == 0 ? '' : '${thread.replies} ${localizations.titleReplies}'}';
    final images = '${thread.images == 0 ? '' : '${thread.images} ${localizations.titleImages}'}';
    return '$replies $images'.trim();
  }

  String _wordForPopupActions(
    AppLocalizations localizations,
    ThreadPopupMenuAction action,
  ) {
    switch (action) {
      case ThreadPopupMenuAction.openLink:
        return localizations.actionOpenLink;
      case ThreadPopupMenuAction.copyLink:
        return localizations.actionCopyLink;
      case ThreadPopupMenuAction.removeFromHistory:
        return localizations.actionRemoveFromHistory;
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
