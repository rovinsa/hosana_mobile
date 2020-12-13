import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:intl/intl.dart';

class Helper {
////////////////////
// Navigator Helpers
///////////////////

// 1. Open Page

  static to(Widget page) {
    Get.to(page);
  }

// 2. Push Replacment - Off

  static off(Widget page) {
    Get.off(page);
  }

////////////////////
// Alerts & Messages
///////////////////

// 1. Show Toas

  static showMessage(String message, BuildContext context, [bool success]) {
    showToast(
      message,
      context: context,
      axis: Axis.horizontal,
      alignment: Alignment.center,
      position: StyledToastPosition.top,
      toastHorizontalMargin: 25,
      fullWidth: true,
      duration: Duration(seconds: 3),
      backgroundColor:
          success != null && success ? ColorTheme.success : Colors.red,
      animation: StyledToastAnimation.slideFromBottom,
      animDuration: Duration(
        milliseconds: 100,
      ),
    );
  }

///////////////////////
// Forms & Validations
//////////////////////

  // 1. Field Focus Change

  static fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // 2. Empty Validation

  static String validateEmpty(String value) {
    if (value.length == 0)
      return 'This field cannot be empty';
    else
      return null;
  }

  // 3. Email Validations

  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  static String getDayDigit(DateTime d) {
// Indian Mobile number are of 10 digit only
    return DateFormat("dd").format(d);
  }

  static String getDayName(DateTime d) {
// Indian Mobile number are of 10 digit only
    return DateFormat("EEEE").format(d);
  }

  static String getMonthName(DateTime d) {
// Indian Mobile number are of 10 digit only
    return DateFormat("MMM").format(d);
  }

  static String getDayDigit2(String date) {
    if(date==null || date.isEmpty)
      return "Err";
    DateFormat format = new DateFormat("yyyy-MM-dd");
    DateTime d = format.parse(date);
    return DateFormat("dd").format(d);
  }
  static String getDayName2(String date) {
    if(date==null || date.isEmpty)
      return "Err";
    DateFormat format = new DateFormat("yyyy-MM-dd");
    DateTime d = format.parse(date);
    return DateFormat("EEEE").format(d);
  }
  static String getMonthName2(String date) {
    if(date==null || date.isEmpty)
      return "Err";
    DateFormat format = new DateFormat("yyyy-MM-dd");
    DateTime d = format.parse(date);
    return DateFormat("MMM").format(d);
  }
  static String getDayNameDate(String date) {
    if(date==null || date.isEmpty)
      return "Invalid-Date";
    // 2020-11-22
    DateFormat format = new DateFormat("yyyy-MM-dd");
    DateTime d = format.parse(date);
    return DateFormat("EEEE, MMM dd").format(d);
  }
}
