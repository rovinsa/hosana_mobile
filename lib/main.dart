import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosanna/pages/intro.dart';
import 'package:hosanna/utlilities/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: ColorTheme.primaryColor,
        accentColor: ColorTheme.primaryColor,
        backgroundColor: ColorTheme.backgroundColor,
        disabledColor: Colors.grey[300],
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Intro(),
    );
  }
}
