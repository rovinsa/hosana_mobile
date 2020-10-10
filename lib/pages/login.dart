import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosanna/pages/forgot_password.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
            ),
            Text(
              'Login',
              style: ColorTheme.mainHeading(ColorTheme.darkColor, 1.3),
            ),
          ],
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                top: 100,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/login_i.png',
                    width: 300,
                    fit: BoxFit.fitWidth,
                  ),
                  Text(
                    'Please Enter your details',
                    style: ColorTheme.mainHeading(),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.only(top: 80),
              child: Form(
                child: Column(
                  children: [
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
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                    ),
                    TextFormField(
                      decoration: ColorTheme.borderInput(
                        'Password',
                        5,
                        ColorTheme.lightColor.withAlpha(80),
                        Icons.lock,
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (e) {},
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 25),
                    ),
                    CustomButton(
                      color: ColorTheme.primaryColor,
                      title: 'Login',
                      hasBorder: false,
                      margin: EdgeInsets.only(bottom: 10),
                      onTap: () {},
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ForgotPassword());
                      },
                      child: Text(
                        'Forgot Password ?',
                        style: ColorTheme.bodyText(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.all(25),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Don’t have account? ',
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
                                  'Create a new account',
                                  style: ColorTheme.linkText(
                                      ColorTheme.primaryColor),
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
          ],
        ),
      ),
    );
  }
}
