import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/storage_entitiy.dart';

class Thread extends StorageEntity {
  final Board board;
  final String threadUrl;
  final int no;
  final String sub;
  final String com;
  final Duration timeFromPublish;
  final int replies;
  final int images;
  final String imageUrl;
  final int imageWidth;
  final int imageHeight;
  final String thumbnailImageUrl;
  final int thumbnailImageWidth;
  final int thumbnailImageHeight;
  final String ext;

  Thread(
      this.board,
      this.threadUrl,
      this.no,
      this.sub,
      this.com,
      this.timeFromPublish,
      this.replies,
      this.images,
      this.imageUrl,
      this.imageWidth,
      this.imageHeight,
      this.thumbnailImageUrl,
      this.thumbnailImageWidth,
      this.thumbnailImageHeight,
      this.ext,
      {id}
  ) : super(id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Thread
          && runtimeType == other.runtimeType
          && board == other.board
          && no == other.no;

  @override
  int get hashCode => board.hashCode ^ no.hashCode;

  @override
  String toString() => '/${board.board}/$no';
}
