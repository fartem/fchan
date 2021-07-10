// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) {
  return Board(
    board: json['board'] as String,
    title: json['title'] as String,
    isFavorite: parseBoolFromInt(json['is_favorite'] as int?),
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'id': instance.id,
      'board': instance.board,
      'title': instance.title,
      'is_favorite': parseBoolToInt(instance.isFavorite),
    };
