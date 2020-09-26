import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/logic/gallery/gallery_item.dart';
import 'package:fchan/provider/gallery_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GalleryState();
}

class _GalleryState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<GalleryModel>(
        builder: (context, model, child) {
          return FutureBuilder<List<GalleryItem>>(
            future: model.gallery(),
            builder: (context, snapshot) {
              // child: Text(
              //   context.fChanWords().galleryIsEmptyMessage,
              // ),
              if (snapshot.hasData) {
                if (snapshot.data.isEmpty) {
                  return Text(
                    context.fChanWords().galleryIsEmptyMessage
                  );
                }
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                  itemBuilder: (context, index) {
                    GalleryItem galleryItem = snapshot.data[index];
                    return Image.file(
                      galleryItem.image,
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              } else if (snapshot.hasError) {
                return Text(
                  context.fChanWords().galleryLoadErrorMessage,
                );
              }
              return CircularProgressIndicator();
            },
          );
        },
      ),
    );
  }
}
