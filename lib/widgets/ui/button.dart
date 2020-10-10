import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';

class CustomButton extends StatelessWidget {
// Properties

  final String title;
  final IconData icon;
  final bool hasBorder;
  final Color color;
  final Function onTap;
  final EdgeInsetsGeometry margin;

// Constructor

  CustomButton({
    this.title,
    this.color,
    this.hasBorder,
    this.icon,
    this.onTap,
    this.margin,
  });

// Build

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin != null ? margin : 0,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(15),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: hasBorder ? Colors.transparent : color,
            border: hasBorder ? Border.all(color: color) : null,
          ),
          child: Row(
            mainAxisAlignment: icon != null
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              icon != null
                  ? Icon(
                      icon,
                      color: hasBorder ? color : Colors.white,
                    )
                  : Container(
                      width: 0,
                      height: 0,
                    ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  title,
                  style:
                      ColorTheme.bodyText(hasBorder ? color : Colors.white, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
