import 'web_image.dart';

class Post {
  final int no;
  final String sub;
  final String com;
  final int replies;
  final Duration timeFromPublish;
  final WebImage image;
  final WebImage thumbnail;
  final String ext;

  Post(
    this.no,
    this.sub,
    this.com,
    this.replies,
    this.timeFromPublish,
    this.image,
    this.thumbnail,
    this.ext,
  );
}
