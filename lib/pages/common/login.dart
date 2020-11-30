import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hosanna/model/user.dart';
import 'package:hosanna/pages/common/forgot_password.dart';
import 'package:hosanna/pages/common/welcome.dart';
import 'package:hosanna/utlilities/Strings.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/loader.dart';
import 'package:hosanna/utlilities/request.dart';
import 'package:hosanna/utlilities/shared_pref_manager.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';
import 'package:hosanna/widgets/ui/image_app_bar.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
// Properties

  int gender;
  String email, password;
  bool isLoading = false;
  GlobalKey<FormState> key = new GlobalKey();

// Text Controllers

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

// Focus Nodes

  final FocusNode passFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();

// init state

  @override
  void initState() {
    super.initState();
    emailCtrl.addListener(setText);
    passCtrl.addListener(setText);
    SharedPrefManager.setString(SharedPrefManager.token, '');
  }

// Set Text

  setText() {
    setState(() {
      password = passCtrl.text;
      email = emailCtrl.text;
    });
  }

// Dispose

  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

// Login

  Future login() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (key.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      key.currentState.save();
      var data = json.encode({
        "email": email,
        "password": password,
      });
      String token = await SharedPrefManager.getString(SharedPrefManager.token);

      Request request = Request(
        Strings.baseURL + Strings.login,
        data,
        token,
      );
      request.post().then((response) {
        print(response);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response);
          setState(() {
            isLoading = false;
          });
          User user = User.fromJson(response.data['user']);
          print(user);
          SharedPrefManager.saveUser(user);
          SharedPrefManager.setString(
            SharedPrefManager.token,
            response.data['token'],
          );
          Helper.off(HomePage());
        } else {
          setState(() {
            isLoading = false;
          });
          print(response.data);
          Helper.showMessage(response.data['message'], context);
        }
      });
    }
  }

// Build
  @override
  Widget build(BuildContext context) {
    return Loader(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageAppBar(
                    title: 'Welcome Back',
                    subtitle: 'Login',
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 15, 15, 50),
                          child: Image.asset(
                            'assets/img/logo_v.png',
                            width: 200,
                          ),
                        ),
                        Image.asset(
                          'assets/img/login_i.png',
                          width: 250,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.only(top: 30),
                    child: Form(
                      key: key,
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
                            onFieldSubmitted: (term) {
                              Helper.fieldFocusChange(
                                context,
                                emailFocus,
                                passFocus,
                              );
                            },
                            validator: Helper.validateEmail,
                            controller: emailCtrl,
                            focusNode: emailFocus,
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
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (term) {
                              login();
                            },
                            validator: Helper.validateEmpty,
                            controller: passCtrl,
                            focusNode: passFocus,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 25),
                          ),
                          CustomButton(
                            color: ColorTheme.primaryColor,
                            title: 'Login'.toUpperCase(),
                            hasBorder: false,
                            margin: EdgeInsets.only(bottom: 10),
                            onTap: () {
                              login();
                            },
                          ),
                          InkWell(
                            onTap: () {
                              Helper.to(ForgotPassword());
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
                                  style: ColorTheme.bodyText(
                                      ColorTheme.darkColor, 1),
                                ),
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: InkWell(
                                      onTap: () {
                                        Helper.off(Welcome());
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
          ),
        ),
      ),
    );
  }
}
