import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';

class CustomListTile extends StatelessWidget {
  // Proper

  final String title, subtitle, unit;
  final IconData icon;
  final Widget trailing;
  final Color color;
  // Constructor

  CustomListTile(
      {Key key,
      this.title,
      this.subtitle,
      this.unit,
      this.icon,
      this.trailing,
      this.color})
      : super(key: key);

  // Build

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ColorTheme.cardDecoration(),
      padding: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color != null
                      ? color.withAlpha(50)
                      : ColorTheme.primaryColor.withAlpha(50),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: color != null ? color : ColorTheme.primaryColor,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(
                  subtitle,
                  style: ColorTheme.bodyText(
                      ColorTheme.darkColor.withAlpha(120), 1.2),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Center(
                child: trailing,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
