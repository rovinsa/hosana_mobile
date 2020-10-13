import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';

class RegisterSuccess extends StatefulWidget {
  @override
  _RegisterSuccessState createState() => _RegisterSuccessState();
}

class _RegisterSuccessState extends State<RegisterSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 70, bottom: 50),
                child: Column(
                  children: [
                    Text(
                      'Hi Godwin',
                      style: ColorTheme.mainHeading(ColorTheme.primaryColor),
                    ),
                    Text(
                      'Congrats, You have successfully registered',
                      style: ColorTheme.subHeading(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/img/welcome.png',
                width: 250,
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 50),
                child: Column(
                  children: [
                    Text(
                      'Welcome to Hosanna',
                      style: ColorTheme.mainHeading(ColorTheme.primaryColor),
                    ),
                    Text(
                      'You are all set to experience a new digital platform exclusive for Christians',
                      style: ColorTheme.subHeading(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              CustomButton(
                color: ColorTheme.primaryColor,
                title: ' LETS GET STARTED'.toUpperCase(),
                hasBorder: false,
                margin: EdgeInsets.only(top: 25),
                onTap: () {
                  // Get.off(Login());
                },
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
