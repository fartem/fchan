import 'package:cached_network_image/cached_network_image.dart';
import 'package:fchan/components/cache/image_cache_manager.dart';
import 'package:fchan/components/widgets/app_centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImageWithLoader extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const AppCachedNetworkImageWithLoader({
    required this.url,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
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
        errorWidget: (_, __, ___) => SizedBox(
          width: width,
          height: height,
          child: const AppCenteredCircularProgressIndicator(),
        ),
        cacheManager: ImageCacheManager(),
      ),
    );
  }
}
