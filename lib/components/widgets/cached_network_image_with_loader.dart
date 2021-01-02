import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';

class CachedNetworkImageWithLoader extends StatelessWidget {
  final String _url;
  final double _width;
  final double _height;

  CachedNetworkImageWithLoader(
    this._url,
    this._width,
    this._height,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: CachedNetworkImage(
        imageUrl: _url,
        width: _width,
        height: _height,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
          );
        },
        errorWidget: (context, url, error) => Container(),
        cacheManager: ImageCacheManager(),
      ),
    );
  }
}

class ImageCacheManager extends BaseCacheManager {
  static final String _key = 'imageCache';

  static ImageCacheManager _instance;

  ImageCacheManager._() : super(_key);

  factory ImageCacheManager() {
    if (_instance == null) {
      _instance = ImageCacheManager._();
    }
    return _instance;
  }

  @override
  Future<String> getFilePath() async {
    final directory = await getApplicationSupportDirectory();
    return '${directory.path}/$_key';
  }
}
