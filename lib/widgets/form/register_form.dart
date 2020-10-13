import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';
import 'package:hosanna/pages/login.dart';
import 'package:hosanna/pages/otp.dart';
import 'package:country_code_picker/country_code_picker.dart';

class RegisterForm extends StatefulWidget {
// Properties

  final String type;

// Constructor

  RegisterForm({this.type});

// State
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
// Properties

  int gender;

// Build

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          widget.type == "user"
              ? Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: ColorTheme.primaryColor.withAlpha(40),
                    ),
                    child: Center(
                      child: Icon(
                        MdiIcons.camera,
                        color: ColorTheme.primaryColor,
                      ),
                    ),
                  ),
                )
              : Container(),
          TextFormField(
            decoration: ColorTheme.borderInput(
              'Name',
              5,
              ColorTheme.lightColor.withAlpha(80),
              MdiIcons.accountCircle,
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (e) {},
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
          TextFormField(
            decoration: ColorTheme.borderInput(
              'Email',
              5,
              ColorTheme.lightColor.withAlpha(80),
              MdiIcons.mail,
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (e) {},
          ),
          Padding(
            padding: EdgeInsets.only(bottom: widget.type == "user" ? 15 : 0),
          ),
          widget.type == "user"
              ? Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: ColorTheme.lightColor.withAlpha(40),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.genderFemale,
                        color: ColorTheme.lightColor.withAlpha(80),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                            isExpanded: true,
                            value: gender,
                            style:
                                ColorTheme.bodyText(ColorTheme.lightColor, 1),
                            decoration: InputDecoration.collapsed(
                                hintText: 'Select Gender'),
                            items: [
                              DropdownMenuItem(
                                child: Text("Male"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Female"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Text("Other"),
                                value: 3,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                gender = value;
                              });
                            }),
                      ),
                    ],
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.only(bottom: widget.type == "user" ? 15 : 0),
          ),
          widget.type == "user"
              ? TextFormField(
                  decoration: ColorTheme.borderInput(
                    'Date Of Birth',
                    5,
                    ColorTheme.lightColor.withAlpha(80),
                    MdiIcons.calendar,
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (e) {},
                )
              : Container(),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
          TextFormField(
            decoration: ColorTheme.borderInput(
              'Password',
              5,
              ColorTheme.lightColor.withAlpha(80),
              MdiIcons.lock,
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (e) {},
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
          TextFormField(
            decoration: ColorTheme.borderInput(
              'Repeat Password',
              5,
              ColorTheme.lightColor.withAlpha(80),
              MdiIcons.lock,
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (e) {},
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: ColorTheme.lightColor.withAlpha(40),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 35,
                  child: CountryCodePicker(
                    onChanged: (e) {
                      print(e.code);
                    },
                    initialSelection: 'AE',
                    favorite: ['+971', 'AE'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                    textStyle: ColorTheme.bodyText(
                      ColorTheme.lightColor,
                      1,
                    ),
                    searchDecoration: ColorTheme.borderInput(
                      'Search',
                      5,
                      ColorTheme.lightColor.withAlpha(80),
                      Icons.search,
                    ),
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    dialogSize: Size(
                      MediaQuery.of(context).size.width,
                      400,
                    ),
                    closeIcon: Icon(
                      Icons.close,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: ColorTheme.noBorderInput(
                      'Phone',
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (e) {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
          TextFormField(
            decoration: ColorTheme.borderInput(
              'Username',
              5,
              ColorTheme.lightColor.withAlpha(80),
              MdiIcons.idCard,
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (e) {},
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: ColorTheme.lightColor.withAlpha(40),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 35,
                  child: CountryCodePicker(
                    onChanged: (e) {
                      print(e.code);
                    },
                    initialSelection: 'AE',
                    // optional. Shows only country name and flag
                    showCountryOnly: true,
                    showFlagMain: true,
                    showOnlyCountryWhenClosed: true,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                    flagWidth: 25,
                    textStyle: ColorTheme.bodyText(
                      ColorTheme.lightColor,
                      1,
                    ),
                    searchDecoration: ColorTheme.borderInput(
                      'Search',
                      5,
                      ColorTheme.lightColor.withAlpha(80),
                      Icons.search,
                    ),
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    dialogSize: Size(
                      MediaQuery.of(context).size.width,
                      400,
                    ),
                    closeIcon: Icon(
                      Icons.close,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25),
          ),
          CustomButton(
            color: ColorTheme.primaryColor,
            title: 'Register',
            hasBorder: false,
            margin: EdgeInsets.only(bottom: 10),
            onTap: () {
              Get.off(OTP());
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.all(25),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Already have an account? ',
                  style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                ),
                WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        Get.off(Login());
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
    );
  }
}
