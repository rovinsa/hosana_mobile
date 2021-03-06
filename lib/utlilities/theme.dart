import 'package:flutter/material.dart';

class ColorTheme {
// Color Variables
  static var primaryColor = Color(0xFF075CF8);
  // static var backgroundColor = Color(0xFFF2F2F2);
  static var backgroundColor = Colors.grey.withAlpha(50);
  static var darkColor = Color(0XFF000000);
  static var lightColor = Color(0XFF000000).withAlpha(150);
  static var warning = Color(0XFFFBCB2B);
  static var danger = Color(0XFFFF7E44);
  static var success = Color(0XFF00CA8A);
  static var blue = Color(0xFF1C96F9);
  static var yellow = Color(0xFFD58217);
  static var red = Color(0xFFFF3F62);
  static var brown = Color(0xFFBF7E68);

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

  static TextStyle secondaryHeading([Color color, double lineHeight]) {
    return TextStyle(
      fontFamily: 'Roboto',
      color: color != null ? color : darkColor,
      fontSize: 14,
      height: lineHeight != null ? lineHeight : 1,
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

  static TextStyle bodyText([Color color, double height, bool bold]) {
    return TextStyle(
      fontFamily: 'Roboto',
      color: color != null ? color : darkColor,
      fontSize: 14,
      height: height != null ? height : 2,
      fontWeight: bold != null && bold ? FontWeight.bold : FontWeight.normal,
    );
  }

  // 5. Small Text

  static TextStyle bodySmall([Color color, double height]) {
    return TextStyle(
      fontFamily: 'Roboto',
      color: color != null ? color : lightColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
      height: height != null ? height : 1,
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

  static BoxDecoration cardDecoration(
      [bool noRadius, double radius, Color borderColor]) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(
        noRadius != null && noRadius ? 0 : radius != null ? radius : 10,
      ),
      border: Border.all(
        color: borderColor != null
            ? borderColor
            : ColorTheme.lightColor.withAlpha(30),
        width: borderColor != null ? 2 : 1,
        style: BorderStyle.solid,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withAlpha(30),
          blurRadius: 10,
        ),
      ],
    );
  }
}
