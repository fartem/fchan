// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thread _$ThreadFromJson(Map<String, dynamic> json) {
  return Thread(
    id: json['id'],
    no: json['no'] as int,
    sub: json['sub'] as String?,
    com: json['com'] as String?,
    tim: json['tim'] as int?,
    ext: json['ext'] as String?,
    imageWidth: json['w'] as int?,
    imageHeight: json['h'] as int?,
    thumbnailWidth: json['tn_w'] as int?,
    thumbnailHeight: json['tn_h'] as int?,
    time: parseTimeFromInt(json['time'] as int),
    replies: json['replies'] as int,
    images: json['images'] as int,
    lastSeenDate: json['last_seen_date'] == null
        ? null
        : DateTime.parse(json['last_seen_date'] as String),
  )..boardId = json['board_id'] as int?;
}

Map<String, dynamic> _$ThreadToJson(Thread instance) => <String, dynamic>{
      'id': instance.id,
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
