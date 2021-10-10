import 'package:fchan/entities/board.dart';
import 'package:fchan/entities/parsers.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'thread.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Thread {
  @JsonKey(ignore: true)
  @HiveField(0)
  late String board;

  @JsonKey(name: 'board_id')
  @HiveField(1)
  int? boardId;

  @HiveField(2)
  final int no;

  @HiveField(3)
  final String? sub;

  @HiveField(4)
  final String? com;

  @HiveField(5)
  final int? tim;

  @HiveField(6)
  final String? ext;

  @JsonKey(fromJson: parseTimeFromInt)
  @HiveField(7)
  final Duration time;

  @JsonKey(name: 'w')
  @HiveField(8)
  final int? imageWidth;

  @JsonKey(name: 'h')
  @HiveField(9)
  final int? imageHeight;

  @JsonKey(name: 'tn_w')
  @HiveField(10)
  final int? thumbnailWidth;

  @JsonKey(name: 'tn_h')
  @HiveField(11)
  final int? thumbnailHeight;

  @HiveField(12)
  final int replies;

  @HiveField(13)
  final int images;

  @JsonKey(name: 'last_seen_date')
  @HiveField(14)
  DateTime? lastSeenDate;

  Thread({
    required this.no,
    required this.time,
    required this.replies,
    required this.images,
    this.sub,
    this.com,
    this.tim,
    this.ext,
    this.imageWidth,
    this.imageHeight,
    this.thumbnailWidth,
    this.thumbnailHeight,
    this.lastSeenDate,
  });

  bool hasImage() => ext != null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Thread && runtimeType == other.runtimeType && board == other.board && no == other.no;

  @override
  int get hashCode => board.hashCode ^ no.hashCode;

  @override
  String toString() => '/$board/$no';

  factory Thread.fromJson(Board board, Map<String, dynamic> json) => _$ThreadFromJson(json)..board = board.board;

  Map<String, dynamic> toJson() => _$ThreadToJson(this);
}
