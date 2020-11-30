import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/list_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Notifications',
        bgColor: Colors.white,
        brightness: Brightness.light,
        iconColor: ColorTheme.darkColor,
        isCenter: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            ListCard(
              title: 'Notification Title',
              subtitle: 'Lorem Ipsum is simply ..',
              icon: MdiIcons.bell,
              color: Colors.orange,
            ),
            ListCard(
              title: 'Notification Title',
              subtitle: 'Lorem Ipsum is simply ..',
              icon: MdiIcons.bell,
              color: Colors.purple,
            ),
            ListCard(
              title: 'Notification Title',
              subtitle: 'Lorem Ipsum is simply ..',
              icon: MdiIcons.bell,
              color: Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }
}
