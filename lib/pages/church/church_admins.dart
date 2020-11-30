import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/member_card.dart';

class Admins extends StatefulWidget {
  @override
  _AdminsState createState() => _AdminsState();
}

class _AdminsState extends State<Admins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Church Admins',
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
          childAspectRatio: 200 / 200,
        ),
        itemBuilder: (BuildContext context, int index) {
          return MemberCard(
            name: 'User $index',
            username: '@userId',
            showControls: true,
            image: 'https://i.pravatar.cc/10$index',
            onTap: () {},
          );
        },
      ),
    );
  }
}
