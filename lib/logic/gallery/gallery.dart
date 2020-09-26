import 'package:fchan/logic/gallery/gallery_item.dart';

abstract class Gallery {
  void save(GalleryItem galleryItem);
  void remove(GalleryItem galleryItem);

  Future<List<GalleryItem>> gallery();
}
