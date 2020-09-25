import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GalleryState();
}

class GalleryState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          context.fChanWords().galleryIsEmptyMessage,
      ),
    );
  }
}
