import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/repositories/data_repository.dart';
import '../../entities/post.dart';
import '../../extensions/duration_extensions.dart';
import '../words/fchan_words.dart';
import 'cached_network_image_with_loader.dart';
import 'content_html_text_widget.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  PostWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    final fChanWords = context.read<FChanWords>();
    final repository = context.read<DataRepository>();
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
                          '${post.no} (${post.time.formatToTime()})',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      if (post.hasImage())
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            '${post.ext} (${post.imageWidth!}x${post.imageHeight!})',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (post.replies != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  '${post.replies} ${post.replies == 1 ? fChanWords.commonReplyText : fChanWords.commonRepliesText}',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    color: Colors.red[700],
                  ),
                ),
              ),
            if (post.hasImage())
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: CachedNetworkImageWithLoader(
                  url: post.thumbnailUrl(repository.baseUrlImage())!,
                  width: post.thumbnailWidth!.toDouble(),
                  height: post.thumbnailHeight!.toDouble(),
                ),
              ),
            if (post.sub != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: ContentHtmlTextWidget(
                  text: post.sub!,
                ),
              ),
            if (post.com != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: ContentHtmlTextWidget(
                  text: post.com!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
