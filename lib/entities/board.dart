import 'package:json_annotation/json_annotation.dart';

import '../logic/db/api/storage_entitiy.dart';
import 'parsers.dart';

part 'board.g.dart';

@JsonSerializable()
class Board extends StorageEntity {
  final String board;
  final String title;

  @JsonKey(
    name: 'is_favorite',
    fromJson: parseBoolFromInt,
    toJson: parseBoolToInt,
  )
  bool? isFavorite;

  Board({
    required this.board,
    required this.title,
    this.isFavorite = false,
    int? id,
  }) : super(id);

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
