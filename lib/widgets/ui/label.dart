import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';

class CustomLabel extends StatelessWidget {
// Props

  final double width, height;
  final Color color;
  final String title;

// Constructor

  CustomLabel({this.width, this.height, this.color, this.title});

// Build
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color.withAlpha(50),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          title,
          style: ColorTheme.bodySmall(color, 1),
        ),
      ),
    );
  }
}
