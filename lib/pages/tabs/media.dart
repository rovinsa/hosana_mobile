import 'package:flutter/material.dart';
import 'package:hosanna/pages/media/images.dart';
import 'package:hosanna/pages/media/music.dart';
import 'package:hosanna/pages/media/videos.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Media extends StatefulWidget {
  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            TabBar(
              indicatorColor: ColorTheme.primaryColor,
              unselectedLabelColor: ColorTheme.lightColor,
              labelColor: ColorTheme.primaryColor,
              tabs: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.image,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Photos'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.video,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Videos'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.music,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Music'),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: ColorTheme.backgroundColor,
                child: TabBarView(
                  children: [
                    Images(),
                    Videos(),
                    MusicPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
