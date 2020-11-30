import 'package:flutter/material.dart';
import 'package:hosanna/pages/tabs/profile.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/member_card.dart';

class Members extends StatefulWidget {
  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Members',
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
            showControls: false,
            image: 'https://i.pravatar.cc/10$index',
            onTap: () {},
          );
        },
      ),
    );
  }
}
