import 'package:fchan/entities/board.dart';
import 'package:fchan/extensions/int_extensions.dart';

class Thread {
  final Board board;
  final String threadUrl;
  final int no;
  final String sub;
  final String com;
  final Duration timeFromPublish;
  final int replies;
  final int images;
  final String ext;
  final String imageUrl;
  final int imageWidth;
  final int imageHeight;

  Thread(
      this.board,
      this.threadUrl,
      this.no,
      this.sub,
      this.com,
      this.timeFromPublish,
      this.replies,
      this.images,
      this.ext,
      this.imageUrl,
      this.imageWidth,
      this.imageHeight,
  );

  factory Thread.fromJson(Map<String, dynamic> json, Board board) {
    return Thread(
      board,
      "https://i.4cdn.org/${board.board}/thread/${json['no']}",
      json['no'],
      json['sub'],
      json['com'],
      DateTime.now().difference((json['time'] as int).dateTimeFromUnixTimestamp()),
      json['replies'],
      json['images'],
      json['ext'],
      json['filename'] != null ? "https://i.4cdn.org/${board.board}/${json['tim']}${json['ext']}" : null,
      json['tn_w'],
      json['tn_h'],
    );
  }

  @override
  String toString() => "/${board.board}/$no";
}
