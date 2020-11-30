import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ResourceCard extends StatelessWidget {
  // Properties

  final String name, dateTime;
  final Function onMore;

// Constructor

  ResourceCard({
    this.name,
    this.dateTime,
    this.onMore,
  });

// Build
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      decoration: ColorTheme.cardDecoration(),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorTheme.primaryColor.withAlpha(30),
                ),
                child: Center(
                  child: Icon(
                    MdiIcons.microsoftWord,
                    size: 20,
                    color: ColorTheme.primaryColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: ColorTheme.secondaryHeading(),
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
            IconButton(
              icon: Icon(
                MdiIcons.dotsVertical,
                color: ColorTheme.darkColor,
              ),
              onPressed: onMore,
            ),
          ],
        ),
      ),
    );
  }
}
