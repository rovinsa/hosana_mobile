import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hosanna/model/user.dart';
import 'package:hosanna/pages/common/register_success.dart';
import 'package:hosanna/utlilities/Strings.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/loader.dart';
import 'package:hosanna/utlilities/request.dart';
import 'package:hosanna/utlilities/shared_pref_manager.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OTP extends StatefulWidget {
// Properties
  final User user;

// constructor

  OTP({@required this.user});

// state
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
// Properties

  String emailOtp, smsOtp;
  bool isLoading = false;
  GlobalKey<FormState> key = new GlobalKey();

// Text Controllers

  final mailCtrl = TextEditingController();
  final smsCtrl = TextEditingController();

// Focus Nodes

  final FocusNode mailFocus = FocusNode();
  final FocusNode smsFocus = FocusNode();

// Init state

  @override
  void initState() {
    super.initState();
    mailCtrl.addListener(setText);
    smsCtrl.addListener(setText);
  }

// Dispose

  @override
  void dispose() {
    mailCtrl.dispose();
    smsCtrl.dispose();
    super.dispose();
  }

// Set Text

  setText() {
    setState(() {
      emailOtp = mailCtrl.text;
      smsOtp = smsCtrl.text;
    });
  }

// Verify OTP

  Future verifyOtp() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (key.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      key.currentState.save();
      var data = json.encode({
        "email_otp": emailOtp,
        "sms_otp": smsOtp,
        "user_id": widget.user.id,
      });

      Request request = Request(Strings.baseURL + Strings.otp, data, null);
      request.post().then((response) {
        print(response);
        if (response.statusCode == 200 || response.statusCode == 201) {
          setState(() {
            isLoading = false;
          });
          User user = User.fromJson(response.data['user']);
          String token = response.data['token'];
          SharedPrefManager.setString(SharedPrefManager.token, token);
          Helper.to(RegisterSuccess(
            user: user,
          ));
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

// Verify OTP

  Future resendOtp(String type) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      isLoading = true;
    });
    key.currentState.save();
    var data = json.encode({
      "user_id": widget.user.id,
      "type": type,
    });

    Request request = Request(Strings.baseURL + Strings.resendOtp, data, null);
    request.post().then((response) {
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          isLoading = false;
        });
        Helper.showMessage(
            '${type.toUpperCase()} OTP sent successfully!', context, true);
      } else {
        setState(() {
          isLoading = false;
        });
        print(response.data);
        Helper.showMessage(response.data['message'], context);
      }
    });
  }

// Build
  @override
  Widget build(BuildContext context) {
    return Loader(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                    padding: EdgeInsets.only(
                        top: 50, left: 25, right: 25, bottom: 50),
                    child: Text(
                      'Please enter OTP sent to your email and entered phone number',
                      style: ColorTheme.subHeading(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Form(
                    key: key,
                    child: Column(
                      children: [
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
                                  obscureText: true,
                                  textInputAction: TextInputAction.next,
                                  focusNode: mailFocus,
                                  controller: mailCtrl,
                                  keyboardType: TextInputType.number,
                                  validator: Helper.validateEmpty,
                                  onFieldSubmitted: (e) {
                                    Helper.fieldFocusChange(
                                      context,
                                      mailFocus,
                                      smsFocus,
                                    );
                                  },
                                ),
                              ),
                              FlatButton(
                                child: Text(
                                  'Resend',
                                  style: ColorTheme.bodyText(
                                      ColorTheme.primaryColor, 1),
                                ),
                                onPressed: () {
                                  resendOtp('email');
                                },
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
                                  obscureText: true,
                                  textInputAction: TextInputAction.done,
                                  focusNode: smsFocus,
                                  controller: smsCtrl,
                                  onFieldSubmitted: (e) {},
                                  keyboardType: TextInputType.number,
                                  validator: Helper.validateEmpty,
                                ),
                              ),
                              FlatButton(
                                child: Text(
                                  'Resend',
                                  style: ColorTheme.bodyText(
                                      ColorTheme.primaryColor, 1),
                                ),
                                onPressed: () {
                                  resendOtp('sms');
                                },
                              ),
                            ],
                          ),
                        ),
                        CustomButton(
                          color: ColorTheme.primaryColor,
                          title: 'VERIFY & PROCEED'.toUpperCase(),
                          hasBorder: false,
                          margin: EdgeInsets.only(top: 25),
                          isLoading: isLoading,
                          onTap: isLoading
                              ? () {}
                              : () {
                                  // Helper.off(RegisterSuccess());
                                  verifyOtp();
                                },
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 50),
                        ),
                      ],
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
