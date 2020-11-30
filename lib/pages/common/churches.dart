import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/church_card.dart';

import 'church_profile.dart';

class Churches extends StatefulWidget {
  @override
  _ChurchesState createState() => _ChurchesState();
}

class _ChurchesState extends State<Churches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Churches',
        bgColor: Colors.white,
        brightness: Brightness.light,
        iconColor: ColorTheme.darkColor,
        isCenter: false,
      ),
      body: GridView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.only(top: 10, bottom: 15, left: 10, right: 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 200 / 255,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ChurchCard(
            church: 'Winston Church',
            username: '@churchId',
            showControls: true,
            onTap: () {
              Helper.to(ChurchProfile());
            },
          );
        },
      ),
    );
  }
}
