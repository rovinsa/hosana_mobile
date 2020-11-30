import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'circle_image.dart';
import 'label.dart';

class PrayerCard extends StatelessWidget {
// Properties

  final String prayer, church, dateTime, type, url;
  final Function onTap;

// Constructor

  PrayerCard(
      {this.prayer,
      this.church,
      this.dateTime,
      this.type,
      this.url,
      this.onTap});

// Build
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: ColorTheme.cardDecoration(),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: CustomCircleImage(
                  height: 50,
                  width: 50,
                  shape: BoxShape.circle,
                  url: url,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      prayer,
                      style: ColorTheme.secondaryHeading(),
                    ),
                    Text(
                      church,
                      style: ColorTheme.bodyText(
                        ColorTheme.lightColor,
                        1.5,
                      ),
                    ),
                    Text(
                      dateTime,
                      style: ColorTheme.bodySmall(
                        ColorTheme.primaryColor,
                        1.5,
                      ),
                    ),
                  ],
                ),
              ),
              CustomLabel(
                color: type == 'Sent'
                    ? ColorTheme.primaryColor
                    : ColorTheme.success,
                title: type == 'Sent'
                    ? 'Sent'.toUpperCase()
                    : 'Accepted'.toUpperCase(),
                height: 30,
                width: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
