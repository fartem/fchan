import 'package:fchan/logic/gallery/gallery.dart';
import 'package:fchan/logic/gallery/gallery_item.dart';

class FakeGallery extends Gallery {
  final List<GalleryItem> _galleryItems = [];

  @override
  void save(GalleryItem galleryItem) {
    _galleryItems.add(galleryItem);
  }

  @override
  void remove(GalleryItem galleryItem) {
    _galleryItems.add(galleryItem);
  }

  @override
  Future<List<GalleryItem>> gallery() async {
    return _galleryItems;
  }
}
