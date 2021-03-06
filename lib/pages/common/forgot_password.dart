import 'package:flutter/material.dart';
import 'package:hosanna/pages/common/password_reset.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
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
                    'Forgot Password',
                    style: ColorTheme.mainHeading(ColorTheme.primaryColor),
                  ),
                ),
                Image.asset(
                  'assets/img/forgot.png',
                  width: 250,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 50),
                  child: Text(
                    'Please enter your email for receiving OTP to reset the password',
                    style: ColorTheme.subHeading(),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextFormField(
                  decoration: ColorTheme.borderInput(
                    'Username / Email',
                    5,
                    ColorTheme.lightColor.withAlpha(80),
                    Icons.person,
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (e) {},
                ),
                CustomButton(
                  color: ColorTheme.primaryColor,
                  title: 'Send otp'.toUpperCase(),
                  hasBorder: false,
                  margin: EdgeInsets.only(top: 25),
                  onTap: () {
                    Helper.off(ResetPassword());
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
