import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hosanna/controllers/app_ctrl.dart';
import 'package:hosanna/controllers/menu_ctrl.dart';
import 'package:hosanna/pages/common/home.dart';
import 'package:hosanna/pages/common/intro.dart';
import 'package:hosanna/utlilities/shared_pref_manager.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

var faker = new Faker();
void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// Properteis

  bool isLoggedIn = false;

// Check Logged In

  checkLoggedIn() async {
    await SharedPrefManager.getUser().then((user) {
      if (user.name != null) {
        setState(() {
          isLoggedIn = true;
        });
      } else {
        setState(() {
          isLoggedIn = false;
        });
      }
    });
  }

// Init State

  @override
  void initState() {
    super.initState();
    checkLoggedIn();
  }

// Build

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hosanna',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorTheme.primaryColor,
        accentColor: ColorTheme.primaryColor,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: ColorTheme.darkColor,
          ),
          color: Colors.transparent,
          elevation: 0.5,
          shadowColor: Colors.black.withAlpha(50),
          actionsIconTheme: IconThemeData(
            color: ColorTheme.primaryColor,
          ),
        ),
        backgroundColor: ColorTheme.backgroundColor,
        disabledColor: Colors.grey[300],
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isLoggedIn ? HomePage() : Intro(),
      defaultTransition: Transition.leftToRight,
      transitionDuration: Duration(milliseconds: 100),
    );
  }
}
