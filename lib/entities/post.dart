import 'package:json_annotation/json_annotation.dart';

import 'parsers.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  @JsonKey(ignore: true)
  String? board;

  final int no;
  final String? sub;
  final String? com;
  final int? replies;
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

  Post({
    this.board,
    required this.no,
    this.sub,
    this.com,
    this.replies,
    this.tim,
    this.ext,
    required this.time,
    this.imageWidth,
    this.imageHeight,
    this.thumbnailWidth,
    this.thumbnailHeight,
  });

  bool hasImage() => ext != null;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
