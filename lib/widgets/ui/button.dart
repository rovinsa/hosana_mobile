import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
// Properties

  final String title;
  final IconData icon;
  final bool hasBorder;
  final Color color, textColor;
  final Function onTap;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double height;
  final bool isRound;
  final double fontSize;
  final bool isLoading;

// Constructor

  CustomButton({
    this.title,
    this.color,
    this.textColor,
    this.hasBorder,
    this.icon,
    this.onTap,
    this.margin,
    this.padding,
    this.height,
    this.isRound,
    this.fontSize,
    this.isLoading,
  });

// Build

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin != null ? margin : 0,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: padding != null ? padding : EdgeInsets.all(15),
          height: height != null ? height : 60,
          decoration: BoxDecoration(
            borderRadius: isRound != null && isRound
                ? BorderRadius.circular(100)
                : BorderRadius.circular(5),
            color: hasBorder ? Colors.white : color,
            border: Border.all(color: hasBorder ? color : Colors.transparent),
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
                padding: EdgeInsets.only(left: icon != null ? 15 : 0),
                child: isLoading != null && isLoading
                    ? Center(
                        child: Container(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.grey[100],
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : Text(
                        title,
                        style: TextStyle(
                          color: hasBorder
                              ? color
                              : textColor != null ? textColor : Colors.white,
                          fontSize: fontSize != null ? fontSize : 15,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
