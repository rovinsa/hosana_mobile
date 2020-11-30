import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';

class EmptyEventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/event_empty.png',
              width: 250,
            ),
            Text(
              'No Event Found',
              style: ColorTheme.mainHeading(
                ColorTheme.primaryColor,
                2,
              ),
            ),
            Text(
              'Sorry there are no events here, please try again later',
              style: ColorTheme.bodyText(
                ColorTheme.darkColor,
                2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
