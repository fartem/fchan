import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../cache/image_cache_manager.dart';
import 'app_centered_circular_progress_indicator.dart';

class AppCachedNetworkImageWithLoader extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const AppCachedNetworkImageWithLoader({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        progressIndicatorBuilder: (_, __, downloadProgress) {
          return Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
          );
        },
        errorWidget: (_, __, ___) => Container(
          width: width,
          height: height,
          child: const AppCenteredCircularProgressIndicator(),
        ),
        cacheManager: ImageCacheManager(),
      ),
    );
  }
}
