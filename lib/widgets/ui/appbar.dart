import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
// Properteis

  final String title;
  final bool isCenter;
  final Color bgColor, iconColor;
  final Brightness brightness;
  final List<Widget> actions;

// Getter

  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

// Constructor

  CustomAppbar({
    this.title,
    this.isCenter,
    this.bgColor,
    this.iconColor,
    this.brightness,
    this.actions,
  });

// Build

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0.5,
      brightness: brightness,
      iconTheme: IconThemeData(color: iconColor),
      centerTitle: isCenter,
      title: Text(
        title,
        style: ColorTheme.mainHeading(
          bgColor == Colors.white ? ColorTheme.darkColor : Colors.white,
          1,
        ),
      ),
      actions: actions,
    );
  }
}
