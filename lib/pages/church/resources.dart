import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/resouce_card.dart';

class Resources extends StatefulWidget {
  @override
  _ResourcesState createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Resources',
        bgColor: Colors.white,
        brightness: Brightness.light,
        iconColor: ColorTheme.darkColor,
        isCenter: false,
      ),
      body: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 10, bottom: 50),
        itemBuilder: (BuildContext context, int index) {
          return ResourceCard(
            name: 'Church Manifesto',
            dateTime: 'Feb 25, 2018',
          );
        },
      ),
    );
  }
}
