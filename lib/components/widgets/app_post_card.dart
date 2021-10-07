import 'package:fchan/components/widgets/app_cached_network_image_with_loader.dart';
import 'package:fchan/components/widgets/app_content_html_text.dart';
import 'package:fchan/data/repositories/data_repository.dart';
import 'package:fchan/entities/post.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/extensions/duration_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppPostCard extends StatelessWidget {
  final Post post;

  const AppPostCard({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataRepository = context.read<DataRepository>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
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
                  '${post.replies} ${post.replies == 1 ? context.localizations.commonReply : context.localizations.commonReplies}',
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
                child: AppCachedNetworkImageWithLoader(
                  url: dataRepository.urlForPostsImageThumbnail(post),
                  width: post.thumbnailWidth!.toDouble(),
                  height: post.thumbnailHeight!.toDouble(),
                ),
              ),
            if (post.sub != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: AppContentHtmlText(
                  text: post.sub!,
                ),
              ),
            if (post.com != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: AppContentHtmlText(
                  text: post.com!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
