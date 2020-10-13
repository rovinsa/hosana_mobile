import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosanna/pages/login.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';

class PasswordSuccess extends StatefulWidget {
  @override
  _PasswordSuccessState createState() => _PasswordSuccessState();
}

class _PasswordSuccessState extends State<PasswordSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 50, bottom: 50),
                child: Text(
                  'Password Changed',
                  style: ColorTheme.mainHeading(ColorTheme.primaryColor),
                ),
              ),
              Image.asset(
                'assets/img/success.png',
                width: 250,
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 50),
                child: Text(
                  'Congratulations. You’ve successfully Changed your password',
                  style: ColorTheme.subHeading(),
                  textAlign: TextAlign.center,
                ),
              ),
              CustomButton(
                color: ColorTheme.primaryColor,
                title: ' Back to Login'.toUpperCase(),
                hasBorder: false,
                margin: EdgeInsets.only(top: 25),
                onTap: () {
                  Get.off(Login());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
