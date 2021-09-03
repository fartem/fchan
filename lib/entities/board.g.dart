// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BoardAdapter extends TypeAdapter<Board> {
  @override
  final int typeId = 0;

  @override
  Board read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Board(
      board: fields[0] as String,
      title: fields[1] as String,
      isFavorite: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Board obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.board)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BoardAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) {
  return Board(
    board: json['board'] as String,
    title: json['title'] as String,
    isFavorite: json['isFavorite'] as bool?,
  );
}

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'board': instance.board,
      'title': instance.title,
      'isFavorite': instance.isFavorite,
    };
