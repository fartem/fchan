// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThreadAdapter extends TypeAdapter<Thread> {
  @override
  final int typeId = 1;

  @override
  Thread read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Thread(
      no: fields[2] as int,
      time: fields[7] as Duration,
      replies: fields[12] as int,
      images: fields[13] as int,
      sub: fields[3] as String?,
      com: fields[4] as String?,
      tim: fields[5] as int?,
      ext: fields[6] as String?,
      imageWidth: fields[8] as int?,
      imageHeight: fields[9] as int?,
      thumbnailWidth: fields[10] as int?,
      thumbnailHeight: fields[11] as int?,
      lastSeenDate: fields[14] as DateTime?,
    )
      ..board = fields[0] as String
      ..boardId = fields[1] as int?;
  }

  @override
  void write(BinaryWriter writer, Thread obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.board)
      ..writeByte(1)
      ..write(obj.boardId)
      ..writeByte(2)
      ..write(obj.no)
      ..writeByte(3)
      ..write(obj.sub)
      ..writeByte(4)
      ..write(obj.com)
      ..writeByte(5)
      ..write(obj.tim)
      ..writeByte(6)
      ..write(obj.ext)
      ..writeByte(7)
      ..write(obj.time)
      ..writeByte(8)
      ..write(obj.imageWidth)
      ..writeByte(9)
      ..write(obj.imageHeight)
      ..writeByte(10)
      ..write(obj.thumbnailWidth)
      ..writeByte(11)
      ..write(obj.thumbnailHeight)
      ..writeByte(12)
      ..write(obj.replies)
      ..writeByte(13)
      ..write(obj.images)
      ..writeByte(14)
      ..write(obj.lastSeenDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThreadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thread _$ThreadFromJson(Map<String, dynamic> json) {
  return Thread(
    no: json['no'] as int,
    time: parseTimeFromInt(json['time'] as int),
    replies: json['replies'] as int,
    images: json['images'] as int,
    sub: json['sub'] as String?,
    com: json['com'] as String?,
    tim: json['tim'] as int?,
    ext: json['ext'] as String?,
    imageWidth: json['w'] as int?,
    imageHeight: json['h'] as int?,
    thumbnailWidth: json['tn_w'] as int?,
    thumbnailHeight: json['tn_h'] as int?,
    lastSeenDate: json['last_seen_date'] == null
        ? null
        : DateTime.parse(json['last_seen_date'] as String),
  )..boardId = json['board_id'] as int?;
}

Map<String, dynamic> _$ThreadToJson(Thread instance) => <String, dynamic>{
      'board_id': instance.boardId,
      'no': instance.no,
      'sub': instance.sub,
      'com': instance.com,
      'tim': instance.tim,
      'ext': instance.ext,
      'time': instance.time.inMicroseconds,
      'w': instance.imageWidth,
      'h': instance.imageHeight,
      'tn_w': instance.thumbnailWidth,
      'tn_h': instance.thumbnailHeight,
      'replies': instance.replies,
      'images': instance.images,
      'last_seen_date': instance.lastSeenDate?.toIso8601String(),
    };
