import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hosanna/pages/media/image_viewer.dart';
import 'package:hosanna/utlilities/helper.dart';

class Images extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 15,
      padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 25),
      itemBuilder: (BuildContext context, int index) => new Container(
        child: InkWell(
          onTap: () {
            Helper.to(
              ImageViewer(
                url: 'https://picsum.photos/20$index',
              ),
            );
          },
          child: Container(
            width: double.infinity,
            child: ExtendedImage.network(
              'https://picsum.photos/20$index',
              fit: BoxFit.fill,
              cache: true,
              border: Border.all(color: Colors.red, width: 1.0),
              //cancelToken: cancellationToken,
            ),
          ),
        ),
      ),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      staggeredTileBuilder: (int index) => StaggeredTile.count(
        2,
        index.isEven ? 2 : 1,
      ),
    );
  }
}
