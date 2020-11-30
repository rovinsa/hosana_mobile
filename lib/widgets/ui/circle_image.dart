import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CustomCircleImage extends StatelessWidget {
// Properties

  final double width, height;
  final String url;
  final BoxShape shape;

// Constructor

  CustomCircleImage({this.width, this.height, this.url, this.shape});

// Build
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExtendedImage.network(
        url,
        fit: BoxFit.fill,
        cache: true,
        shape: shape,
        width: width,
        height: height,
        //cancelToken: cancellationToken,
      ),
    );
  }
}
