class Post {
  final int no;
  final String sub;
  final String com;
  final int replies;
  final Duration timeFromPublish;
  final String filename;
  final int imageWidth;
  final int imageHeight;
  final int thumbnailImageWidth;
  final int thumbnailImageHeight;
  final String ext;

  String imageLink;
  String thumbnailLink;

  Post(
    this.no,
    this.sub,
    this.com,
    this.replies,
    this.timeFromPublish,
    this.filename,
    this.imageWidth,
    this.imageHeight,
    this.thumbnailImageWidth,
    this.thumbnailImageHeight,
    this.ext,
  );

  bool hasImage() => filename != null;
}
