import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/music_card.dart';

class MusicPage extends StatefulWidget {
  final asPage;
  MusicPage({this.asPage});
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return widget.asPage != null && widget.asPage
        ? Scaffold(
            appBar: CustomAppbar(
              title: 'Music',
              bgColor: Colors.white,
              brightness: Brightness.light,
              iconColor: ColorTheme.darkColor,
              isCenter: false,
            ),
            body: musicElements(),
          )
        : musicElements();
  }

// Music View

  Widget musicElements() {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.only(top: 10, bottom: 15, left: 10, right: 0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 100 / 102,
      ),
      itemBuilder: (BuildContext context, int index) {
        return MusicCard();
      },
    );
  }
}
