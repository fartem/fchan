import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../entities/post.dart';
import '../../extensions/build_context_extensions.dart';
import '../../extensions/duration_extensions.dart';
import 'cached_network_image_with_loader.dart';
import 'content_html_text_widget.dart';

class PostWidget extends StatelessWidget {
  final Post _post;

  PostWidget(this._post);

  @override
  Widget build(BuildContext context) {
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
                          '${_post.no} (${_post.timeFromPublish.formatToTime()})',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      if (_post.hasImage())
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            '${_post.ext} (${_post.imageWidth}x${_post.imageHeight})',
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
            if (_post.replies != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  '${_post.replies} ${_post.replies == 1 ? context.fChanWords().commonReplyText : context.fChanWords().commonRepliesText}',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    color: Colors.red[700],
                  ),
                ),
              ),
            if (_post.hasImage())
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: CachedNetworkImageWithLoader(
                  _post.thumbnailLink,
                  _post.thumbnailImageWidth.toDouble(),
                  _post.thumbnailImageHeight.toDouble(),
                ),
              ),
            if (_post.sub != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: ContentHtmlTextWidget(
                  _post.sub,
                ),
              ),
            if (_post.com != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: ContentHtmlTextWidget(
                  _post.com,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
