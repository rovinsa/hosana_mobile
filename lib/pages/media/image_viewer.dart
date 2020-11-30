import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/circle_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ImageViewer extends StatefulWidget {
  final String url;

  ImageViewer({this.url});

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppbar(
        title: '1 of 1',
        bgColor: Colors.black,
        brightness: Brightness.dark,
        iconColor: Colors.white,
        isCenter: true,
        actions: [
          IconButton(
            icon: Icon(
              MdiIcons.plusCircleOutline,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: ExtendedImage.network(
                    widget.url,
                    fit: BoxFit.fitWidth,
                    cache: true,
                    mode: ExtendedImageMode.gesture,
                    //cancelToken: cancellationToken,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 15,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: CustomCircleImage(
                      height: 50,
                      width: 50,
                      shape: BoxShape.circle,
                      url: 'https://i.pravatar.cc/100',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: ColorTheme.secondaryHeading(Colors.white),
                        ),
                        Row(
                          children: [
                            Text(
                              '3h',
                              style: ColorTheme.bodySmall(
                                Colors.white,
                              ),
                            ),
                            Text('.'),
                            Icon(
                              Icons.language,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
