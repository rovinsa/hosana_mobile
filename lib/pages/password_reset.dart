import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosanna/pages/password_success.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
                margin: EdgeInsets.only(top: 100, bottom: 80),
                child: Text(
                  'Reset Password',
                  style: ColorTheme.mainHeading(ColorTheme.primaryColor),
                ),
              ),
              Image.asset(
                'assets/img/reset.png',
                width: 250,
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 80, left: 25, right: 25, bottom: 50),
                child: Text(
                  'Please enter your new password',
                  style: ColorTheme.subHeading(),
                  textAlign: TextAlign.center,
                ),
              ),
              TextFormField(
                decoration: ColorTheme.borderInput(
                  'New Password',
                  5,
                  ColorTheme.lightColor.withAlpha(50),
                  MdiIcons.lock,
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (e) {},
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              TextFormField(
                decoration: ColorTheme.borderInput(
                  'Repeat Password',
                  5,
                  ColorTheme.lightColor.withAlpha(50),
                  MdiIcons.lock,
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (e) {},
              ),
              CustomButton(
                color: ColorTheme.primaryColor,
                title: 'Reset Password'.toUpperCase(),
                hasBorder: false,
                margin: EdgeInsets.only(top: 25),
                onTap: () {
                  Get.to(PasswordSuccess());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}