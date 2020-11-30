import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/Strings.dart';
import 'package:hosanna/utlilities/theme.dart';

class PrayerDetails extends StatefulWidget {
  @override
  _PrayerDetailsState createState() => _PrayerDetailsState();
}

class _PrayerDetailsState extends State<PrayerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: ColorTheme.darkColor),
        title: Container(
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/100',
                  ),
                  backgroundColor: ColorTheme.primaryColor,
                ),
                margin: EdgeInsets.only(right: 10),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Winston Church',
                      style: ColorTheme.secondaryHeading(),
                    ),
                    Text(
                      '@churchId',
                      style: ColorTheme.bodySmall(
                        ColorTheme.lightColor,
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  size: 22,
                  color: ColorTheme.darkColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(25),
          decoration: ColorTheme.cardDecoration(),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prayer for exam',
                style: ColorTheme.mainHeading(
                  ColorTheme.darkColor,
                  1,
                ),
              ),
              Text(
                'Feb 25, 2018 - 11:00 AM',
                style: ColorTheme.bodyText(
                  ColorTheme.primaryColor,
                  2,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  color: Colors.grey[400],
                  height: 2,
                ),
              ),
              Text(
                Strings.lorem,
                style: ColorTheme.bodyText(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
