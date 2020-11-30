import 'package:flutter/material.dart';
import 'package:hosanna/pages/common/prayer_details.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/circle_image.dart';
import 'package:hosanna/widgets/ui/label.dart';
import 'package:hosanna/widgets/ui/prayer_card.dart';

class PrayerRequests extends StatefulWidget {
  @override
  _PrayerRequestsState createState() => _PrayerRequestsState();
}

class _PrayerRequestsState extends State<PrayerRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'My Prayer Requests',
        bgColor: Colors.white,
        brightness: Brightness.light,
        iconColor: ColorTheme.darkColor,
        isCenter: false,
      ),
      body: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 10, bottom: 50),
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return PrayerCard(
            onTap: () {
              Helper.to(PrayerDetails());
            },
            prayer: 'Prayer for exam',
            church: 'Winston Church',
            dateTime: 'Feb 25, 2018 - 11:00 AM',
            type: index == 0 ? 'Sent' : 'accepted',
            url: 'https://i.pravatar.cc/100',
          );
        },
      ),
    );
  }
}
