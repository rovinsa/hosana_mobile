import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/video_card.dart';

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 15),
      itemBuilder: (BuildContext context, int index) {
        return VideoCard();
      },
    );
  }
}
