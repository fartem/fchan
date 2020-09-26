import 'package:fchan/logic/gallery/gallery.dart';
import 'package:fchan/logic/gallery/gallery_item.dart';
import 'package:flutter/material.dart';

class GalleryModel extends ChangeNotifier {
  final Gallery _gallery;

  GalleryModel(this._gallery);

  Future<List<GalleryItem>> gallery() => _gallery.gallery();
}
