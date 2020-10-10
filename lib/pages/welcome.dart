import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';

import 'login.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 120, 15, 50),
                child: Image.asset(
                  'assets/img/logo_v.png',
                  width: 200,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 80),
                child: Column(
                  children: [
                    Text(
                      'Sign Up',
                      style: ColorTheme.mainHeading(
                        ColorTheme.primaryColor,
                      ),
                    ),
                    Text(
                      'Please select your account type',
                      style: ColorTheme.subHeading(),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    CustomButton(
                      color: ColorTheme.primaryColor,
                      hasBorder: false,
                      icon: Icons.person,
                      onTap: () {
                        Get.to(Login());
                      },
                      title: 'I am a User',
                      margin: EdgeInsets.only(bottom: 15),
                    ),
                    CustomButton(
                      color: ColorTheme.primaryColor,
                      hasBorder: true,
                      icon: Icons.fitness_center,
                      onTap: () {},
                      title: 'I am a Church / Ministry',
                      margin: EdgeInsets.only(bottom: 15),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.all(25),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Already have a account?',
                      style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                    ),
                    WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: InkWell(
                          onTap: () {
                            Get.to(Login());
                          },
                          child: Text(
                            'Login',
                            style: ColorTheme.linkText(ColorTheme.primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
