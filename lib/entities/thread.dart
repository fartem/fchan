import 'package:json_annotation/json_annotation.dart';

import '../data/providers/local/api/storage_entitiy.dart';
import 'board.dart';
import 'parsers.dart';

part 'thread.g.dart';

@JsonSerializable()
class Thread extends StorageEntity {
  @JsonKey(ignore: true)
  late Board board;

  @JsonKey(name: 'board_id')
  int? boardId;

  final int no;
  final String? sub;
  final String? com;
  final int? tim;
  final String? ext;

  @JsonKey(fromJson: parseTimeFromInt)
  final Duration time;

  @JsonKey(name: 'w')
  final int? imageWidth;

  @JsonKey(name: 'h')
  final int? imageHeight;

  @JsonKey(name: 'tn_w')
  final int? thumbnailWidth;

  @JsonKey(name: 'tn_h')
  final int? thumbnailHeight;

  final int replies;
  final int images;

  @JsonKey(name: 'last_seen_date')
  DateTime? lastSeenDate;

  late String link;

  Thread({
    id,
    required this.no,
    this.sub,
    this.com,
    this.tim,
    this.ext,
    this.imageWidth,
    this.imageHeight,
    this.thumbnailWidth,
    this.thumbnailHeight,
    required this.time,
    required this.replies,
    required this.images,
    this.lastSeenDate,
  }) : super(id);

  bool hasImage() => ext != null;

  String? imageUrl(String base) => '$base/${board.board}/$tim$ext';

  String? thumbnailUrl(String base) => '$base/${board.board}/${tim}s.jpg';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Thread && runtimeType == other.runtimeType && board == other.board && no == other.no;

  @override
  int get hashCode => board.hashCode ^ no.hashCode;

  @override
  String toString() => '/${board.board}/$no';

  factory Thread.fromJson(Board board, Map<String, dynamic> json) => _$ThreadFromJson(json)..board = board;

  Map<String, dynamic> toJson() {
    final json = _$ThreadToJson(this);
    json['board_id'] = board.id;
    return json;
  }
}
