import '../logic/db/storage_entitiy.dart';
import 'board.dart';
import 'web_image.dart';

class Thread extends StorageEntity {
  final Board board;
  final String threadUrl;
  final int no;
  final String sub;
  final String com;
  final Duration timeFromPublish;
  final int replies;
  final int images;
  final WebImage image;
  final WebImage thumbnail;
  final String ext;

  DateTime lastSeenDate;

  Thread(
    this.board,
    this.threadUrl,
    this.no,
    this.sub,
    this.com,
    this.timeFromPublish,
    this.replies,
    this.images,
    this.image,
    this.thumbnail,
    this.ext,
    this.lastSeenDate, {
    id,
  }) : super(id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Thread && runtimeType == other.runtimeType && board == other.board && no == other.no;

  @override
  int get hashCode => board.hashCode ^ no.hashCode;

  @override
  String toString() => '/${board.board}/$no';
}
