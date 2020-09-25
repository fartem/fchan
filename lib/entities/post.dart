import 'package:fchan/entities/board.dart';
import 'package:fchan/extensions/int_extensions.dart';

class Post {
  final int no;
  final String sub;
  final String com;
  final Duration timeFromPublish;
  final String imageUrl;
  final int imageWidth;
  final int imageHeight;
  final int imageThumbnailWidth;
  final int imageThumbnailHeight;
  final String ext;

  Post(
      this.no,
      this.sub,
      this.com,
      this.timeFromPublish,
      this.imageUrl,
      this.imageWidth,
      this.imageHeight,
      this.imageThumbnailWidth,
      this.imageThumbnailHeight,
      this.ext,
  );

  factory Post.fromJson(Map<String, dynamic> json, Board board) {
    return Post(
      json['no'],
      json['sub'],
      json['com'],
      DateTime.now().difference((json['time'] as int).dateTimeFromUnixTimestamp()),
      json['filename'] != null ? "https://i.4cdn.org/${board.board}/${json['tim']}${json['ext']}" : null,
      json['w'],
      json['h'],
      json['tn_w'],
      json['tn_h'],
      json['ext'],
    );
  }
}
