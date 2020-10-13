import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosanna/pages/register_success.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OTP extends StatefulWidget {
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
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
                  'OTP Verification',
                  style: ColorTheme.mainHeading(ColorTheme.primaryColor),
                ),
              ),
              Image.asset(
                'assets/img/otp.png',
                width: 250,
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 50),
                child: Text(
                  'Please enter OTP sent to your email and entered phone number',
                  style: ColorTheme.subHeading(),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorTheme.lightColor.withAlpha(
                      30,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      MdiIcons.lock,
                      color: ColorTheme.lightColor.withAlpha(80),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: ColorTheme.noBorderInput(
                          'Email OTP',
                        ),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (e) {},
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Resend',
                        style: ColorTheme.bodyText(ColorTheme.primaryColor, 1),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorTheme.lightColor.withAlpha(
                      30,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      MdiIcons.lock,
                      color: ColorTheme.lightColor.withAlpha(80),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: ColorTheme.noBorderInput(
                          'SMS OTP',
                        ),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (e) {},
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Resend',
                        style: ColorTheme.bodyText(ColorTheme.primaryColor, 1),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              CustomButton(
                color: ColorTheme.primaryColor,
                title: 'VERIFY & PROCEED'.toUpperCase(),
                hasBorder: false,
                margin: EdgeInsets.only(top: 25),
                onTap: () {
                  Get.off(RegisterSuccess());
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
