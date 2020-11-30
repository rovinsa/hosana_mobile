import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:hosanna/utlilities/theme.dart';

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
}
