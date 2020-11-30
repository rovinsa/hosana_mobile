import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';

class ListCard extends StatelessWidget {
// Properties
  final String title, subtitle;
  final IconData icon;
  final Color color;
  final bool noDecoration;
  final Function onTap;
  final bool showArrow;

// Constructor

  ListCard({
    this.title,
    this.subtitle,
    this.color,
    this.icon,
    this.noDecoration,
    this.onTap,
    this.showArrow,
  });

// Build
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: noDecoration != null && noDecoration
            ? EdgeInsets.all(0)
            : EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: noDecoration != null && noDecoration
            ? null
            : ColorTheme.cardDecoration(),
        padding: noDecoration != null && noDecoration
            ? EdgeInsets.fromLTRB(15, 10, 15, 10)
            : EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withAlpha(30),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 20,
                  color: color,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: ColorTheme.bodyText(
                      ColorTheme.darkColor,
                      1,
                      true,
                    ),
                  ),
                  subtitle != null
                      ? Text(
                          subtitle,
                          style: ColorTheme.bodyText(
                            ColorTheme.lightColor,
                            1.5,
                          ),
                        )
                      : Container(
                          width: 0,
                          height: 0,
                        ),
                ],
              ),
            ),
            showArrow != null && showArrow
                ? Icon(
                    Icons.chevron_right,
                    color: ColorTheme.lightColor,
                    size: 18,
                  )
                : Container(
                    width: 0,
                    height: 0,
                  ),
          ],
        ),
      ),
    );
  }
}
