class Post {
  final int no;
  final String sub;
  final String com;
  final int replies;
  final Duration timeFromPublish;
  final String imageUrl;
  final int imageWidth;
  final int imageHeight;
  final String thumbnailImageUrl;
  final int thumbnailImageWidth;
  final int thumbnailImageHeight;
  final String ext;

  Post(
      this.no,
      this.sub,
      this.com,
      this.replies,
      this.timeFromPublish,
      this.imageUrl,
      this.imageWidth,
      this.imageHeight,
      this.thumbnailImageUrl,
      this.thumbnailImageWidth,
      this.thumbnailImageHeight,
      this.ext,
  );
}
