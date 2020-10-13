import 'package:flutter/material.dart';

class ColorTheme {
// Color Variables
  static var primaryColor = Color(0xFF075CF8);
  static var backgroundColor = Color(0xFFF2F2F2);
  static var darkColor = Color(0XFF000000);
  static var lightColor = Color(0XFF000000).withAlpha(150);
  static var warning = Color(0XFFFBCB2B);
  static var danger = Color(0XFFFF7E44);
  static var success = Color(0XFF00CA8A);

// Text Styles

  // 1. Headings

  static TextStyle mainHeading([Color color, double height]) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w800,
      color: color == null ? darkColor : color,
      fontSize: 18,
      height: height != null ? height : 2,
    );
  }

  // 2. Secondary Heading

  static TextStyle secondaryHeading([Color color]) {
    return TextStyle(
      fontFamily: 'Roboto',
      color: color != null ? color : darkColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  // 3. Link Text

  static TextStyle linkText([Color color]) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: color != null ? color : darkColor,
      fontSize: 14,
      decoration: TextDecoration.underline,
    );
  }

  // 4. Secondary Heading

  static TextStyle bodyText([Color color, double height]) {
    return TextStyle(
      fontFamily: 'Roboto',
      color: color != null ? color : darkColor,
      fontSize: 14,
      height: height != null ? height : 2,
    );
  }

  // 5. Small Text

  static TextStyle bodySmall([Color color]) {
    return TextStyle(
      fontFamily: 'Roboto',
      color: color != null ? color : lightColor,
      fontSize: 10,
      fontWeight: FontWeight.w200,
      decoration: TextDecoration.none,
    );
  }

  // Body Tiny

  static TextStyle bodyTiny([Color color]) {
    return TextStyle(
      fontFamily: 'Roboto',
      color: color != null ? color : lightColor,
      fontSize: 9,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    );
  }

  // Sub Heading

  static TextStyle subHeading([Color color]) {
    return TextStyle(
      fontFamily: 'Roboto',
      color: color != null ? color : lightColor,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      height: 2,
    );
  }

// Form Styles

  static InputDecoration borderInput([
    String hint,
    double radius,
    Color color,
    IconData icon,
  ]) {
    return InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20, 15, 15, 15),
      hintText: hint != null ? hint : '',
      hintStyle: TextStyle(
        color: lightColor,
        fontSize: 16,
      ),
      prefixIcon: icon != null
          ? Icon(
              icon,
              size: 22,
              color: color,
            )
          : null,
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color.withAlpha(80),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorTheme.primaryColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorTheme.primaryColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color.withAlpha(30),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

// No Input Border

  static InputDecoration noBorderInput(String hint) {
    return InputDecoration.collapsed(
      hintText: hint,
    );
  }

// Card Styling

  static BoxDecoration cardDecoration([bool noRadius]) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(noRadius != null && noRadius ? 0 : 5),
      border: Border.all(
        color: lightColor,
        width: 1,
        style: BorderStyle.solid,
      ),
    );
  }

// Card Title

  static TextStyle cardTitle([Color color]) {
    return TextStyle(
      fontFamily: 'Roboto',
      color: color != null ? color : darkColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1,
    );
  }

// Card subtitle

  static TextStyle cardSubTitle([Color color]) {
    return TextStyle(
      fontFamily: 'Roboto',
      color: color != null ? color : darkColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

// Card subtitle

  static TextStyle cardBody([Color color]) {
    return TextStyle(
      fontFamily: 'Roboto',
      color: color != null ? color : darkColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }
}
