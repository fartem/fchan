import '../logic/db/api/storage_entitiy.dart';
import 'board.dart';
import 'web_image.dart';

class Thread extends StorageEntity {
  final Board board;
  final int no;
  final String? sub;
  final String? com;
  final Duration timeFromPublish;
  final int replies;
  final int images;
  final WebImage? image;
  final WebImage? thumbnail;
  final String? ext;

  DateTime? lastSeenDate;

  Thread({
    id,
    required this.board,
    required this.no,
    this.sub,
    this.com,
    required this.timeFromPublish,
    required this.replies,
    required this.images,
    this.image,
    this.thumbnail,
    this.ext,
    this.lastSeenDate,
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
