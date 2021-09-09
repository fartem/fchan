// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    no: json['no'] as int,
    sub: json['sub'] as String?,
    com: json['com'] as String?,
    replies: json['replies'] as int?,
    tim: json['tim'] as int?,
    ext: json['ext'] as String?,
    time: parseTimeFromInt(json['time'] as int),
    imageWidth: json['w'] as int?,
    imageHeight: json['h'] as int?,
    thumbnailWidth: json['tn_w'] as int?,
    thumbnailHeight: json['tn_h'] as int?,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'no': instance.no,
      'sub': instance.sub,
      'com': instance.com,
      'replies': instance.replies,
      'tim': instance.tim,
      'ext': instance.ext,
      'time': instance.time.inMicroseconds,
      'w': instance.imageWidth,
      'h': instance.imageHeight,
      'tn_w': instance.thumbnailWidth,
      'tn_h': instance.thumbnailHeight,
    };
