import 'package:json_annotation/json_annotation.dart';

import '../logic/db/sqflite_database.dart';
import 'storage_entitiy.dart';

part 'board.g.dart';

@JsonSerializable()
class Board extends StorageEntity {
  final String board;
  final String title;

  @JsonKey(
    name: columnBoardIsFavorite,
    nullable: true,
    defaultValue: false,
    fromJson: _boolFromJson,
    toJson: _boolToJson,
  )
  bool isFavorite;

  Board(
    this.board,
    this.title,
    this.isFavorite, {
    int id,
  }) : super(id);

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  Map<String, dynamic> toJson() => _$BoardToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Board &&
          runtimeType == other.runtimeType &&
          board == other.board &&
          title == other.title;

  @override
  int get hashCode => board.hashCode ^ title.hashCode;

  @override
  String toString() => '/$board/ - $title';
}

bool _boolFromJson(int value) => value == 1;

int _boolToJson(bool value) => value ? 1 : 0;
