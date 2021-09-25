import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/repositories/data_repository.dart';
import '../../entities/thread.dart';
import '../../extensions/build_context_extensions.dart';
import '../../extensions/duration_extensions.dart';
import '../routes/fchan_routes.dart';
import 'app_cached_network_image_with_loader.dart';
import 'app_content_html_text.dart';

class AppThreadCard extends StatelessWidget {
  final Thread thread;
  final Function? tapNotifier;
  final List<ThreadPopupMenuAction> availableActions;
  final Function(ThreadPopupMenuAction)? actionNotifier;

  const AppThreadCard({
    Key? key,
    required this.thread,
    this.tapNotifier,
    required this.availableActions,
    this.actionNotifier,
  }) : super(key: key);

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
                              localizations: context.localizations,
                              thread: thread,
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
                            localizations: context.localizations,
                            action: action,
                          ),
                        ),
                      );
                    }).toList(),
                    onSelected: (action) async {
                      switch (action) {
                        case ThreadPopupMenuAction.openLink:
                          launch(dataRepository.urlForThread(thread));
                          break;
                        case ThreadPopupMenuAction.copyLink:
                          await FlutterClipboard.copy(
                            dataRepository.urlForThread(thread),
                          );
                          break;
                        case ThreadPopupMenuAction.removeFromHistory:
                          dataRepository.removeThreadFromHistory(thread);
                          break;
                        case ThreadPopupMenuAction.addToBookmarks:
                          dataRepository.addThreadToBookmarks(thread);
                          break;
                        case ThreadPopupMenuAction.removeFromBookmarks:
                          dataRepository.removeThreadFromBookmarks(thread);
                          break;
                      }
                      actionNotifier?.call(action);
                    },
                    child: Icon(
                      Icons.more_vert,
                    ),
                  ),
                ],
              ),
              if (thread.hasImage())
                AppCachedNetworkImageWithLoader(
                  url: dataRepository.urlForThreadsImageThumbnail(thread),
                  width: thread.thumbnailWidth!.toDouble(),
                  height: thread.thumbnailHeight!.toDouble(),
                ),
              if (thread.sub != null)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: AppContentHtmlText(
                    text: thread.sub!,
                    bodyWeight: FontWeight.bold,
                  ),
                ),
              if (thread.com != null)
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: AppContentHtmlText(
                    text: thread.com!,
                    wrapText: true,
                  ),
                ),
            ],
          ),
        ),
        onTap: () {
          tapNotifier?.call();
          context.push(
            route: routeThread,
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

  String _prepareThreadRepliesAndImagesInfo({
    required AppLocalizations localizations,
    required Thread thread,
  }) {
    final replies = '${thread.replies == 0 ? '' : '${thread.replies} ${localizations.titleReplies}'}';
    final images = '${thread.images == 0 ? '' : '${thread.images} ${localizations.titleImages}'}';
    return '$replies $images'.trim();
  }

  String _wordForPopupActions({
    required AppLocalizations localizations,
    required ThreadPopupMenuAction action,
  }) {
    switch (action) {
      case ThreadPopupMenuAction.openLink:
        return localizations.actionOpenLink;
      case ThreadPopupMenuAction.copyLink:
        return localizations.actionCopyLink;
      case ThreadPopupMenuAction.removeFromHistory:
        return localizations.actionRemoveFromHistory;
      case ThreadPopupMenuAction.addToBookmarks:
        return localizations.actionAddToBookmarks;
      case ThreadPopupMenuAction.removeFromBookmarks:
        return localizations.actionRemoveFromBookmarks;
    }
  }
}

enum ThreadPopupMenuAction {
  openLink,
  copyLink,
  removeFromHistory,
  addToBookmarks,
  removeFromBookmarks,
}
