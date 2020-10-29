import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';

class CachedNetworkImageWithLoader extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  CachedNetworkImageWithLoader(
      this.url,
      this.width,
      this.height,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
        ),
        errorWidget: (context, url, error) => Container(),
        cacheManager: ImageCacheManager(),
      ),
    );
  }
}

class ImageCacheManager extends BaseCacheManager {
  static final String key = 'imageCache';

  static ImageCacheManager _instance;

  ImageCacheManager._(): super(key);

  factory ImageCacheManager() {
    if (_instance == null) {
      _instance = ImageCacheManager._();
    }
    return _instance;
  }

  @override
  Future<String> getFilePath() async {
    final directory = await getApplicationSupportDirectory();
    return '${directory.path}/$key';
  }
}
