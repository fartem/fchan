import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'board.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Board {
  @HiveField(0)
  final String board;

  @HiveField(1)
  final String title;

  Board({
    required this.board,
    required this.title,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Board && runtimeType == other.runtimeType && board == other.board && title == other.title;

  @override
  int get hashCode => board.hashCode ^ title.hashCode;

  @override
  String toString() => '/$board/ - $title';

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  Map<String, dynamic> toJson() => _$BoardToJson(this);
}
