import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';

class ImageCacheManager extends CacheManager {
  static const String _key = 'imageCache';

  static ImageCacheManager? _instance;

  ImageCacheManager._() : super(Config(_key));

  factory ImageCacheManager() {
    _instance ??= ImageCacheManager._();
    return _instance!;
  }

  Future<String> getFilePath() async {
    final directory = await getApplicationSupportDirectory();
    return '${directory.path}/$_key';
  }
}
