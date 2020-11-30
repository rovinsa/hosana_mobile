import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hosanna/model/user.dart';
import 'package:hosanna/pages/common/login.dart';
import 'package:hosanna/pages/common/otp.dart';
import 'package:hosanna/utlilities/Strings.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/request.dart';
import 'package:hosanna/utlilities/shared_pref_manager.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

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
  String name, email, dob, password, rptPassword, phone, username, country;
  File _image;
  String photo = "";
  bool isLoading = false;
  GlobalKey<FormState> key = new GlobalKey();

// Text Controllers

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final dobCtrl = TextEditingController();
  final pwdCtrl = TextEditingController();
  final rptPwdCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();

// Focus Nodes

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode dobFocus = FocusNode();
  final FocusNode pwdFocus = FocusNode();
  final FocusNode rptFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode countryFocus = FocusNode();

// init state

  @override
  void initState() {
    super.initState();
    nameCtrl.addListener(setText);
    emailCtrl.addListener(setText);
    dobCtrl.addListener(setText);
    pwdCtrl.addListener(setText);
    rptPwdCtrl.addListener(setText);
    phoneCtrl.addListener(setText);
    country = 'United Arab Emirates';
    usernameCtrl.addListener(setText);
  }

// Set Text

  setText() {
    setState(() {
      name = nameCtrl.text;
      email = emailCtrl.text;
      dob = dobCtrl.text;
      password = pwdCtrl.text;
      rptPassword = rptPwdCtrl.text;
      phone = phoneCtrl.text;
      username = usernameCtrl.text;
    });
  }

// Dispose

  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    dobCtrl.dispose();
    pwdCtrl.dispose();
    rptPwdCtrl.dispose();
    phoneCtrl.dispose();
    usernameCtrl.dispose();
    super.dispose();
  }

// Image Picker

  Future getImage() async {
    var selectedImage = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
    );
    if (selectedImage != null) {
      setState(() {
        _image = selectedImage;
        File imageFile = new File(_image.path);
        List<int> imageBytes = imageFile.readAsBytesSync();
        photo = base64.encode(imageBytes);
      });
    } else {
      Helper.showMessage('You did not select a photo', context);
    }
    return "success";
  }

// Register

  Future register() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (key.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      key.currentState.save();
      var data = json.encode({
        "name": name,
        "username": username,
        "email": email,
        "type": widget.type,
        "password": password,
        "password_confirmation": rptPassword,
        "phone": phone,
        "country": country,
      });
      String token = await SharedPrefManager.getString(SharedPrefManager.token);

      Request request =
          Request(Strings.baseURL + Strings.register, data, token);
      request.post().then((response) {
        print(response);
        if (response.statusCode == 200 || response.statusCode == 201) {
          setState(() {
            isLoading = false;
          });
          User user = User.fromJson(response.data);
          Helper.to(OTP(
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

// Build

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        children: [
          widget.type == "user"
              ? Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Center(
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Material(
                          elevation: 0,
                          child: InkWell(
                            onTap: getImage,
                            child: _image == null
                                ? Container(
                                    width: 100,
                                    height: 100,
                                    child: Center(
                                      child: Icon(
                                        MdiIcons.image,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[200],
                                    ),
                                  )
                                : Container(
                                    width: 100,
                                    height: 100,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.file(
                                          _image,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                          ),
                        ),
                        Positioned(
                          bottom: -10,
                          right: -10,
                          width: 40,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.1, 0.9],
                                colors: [
                                  Theme.of(context).primaryColor,
                                  Theme.of(context).primaryColor.withAlpha(
                                        180,
                                      ),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                            child: InkWell(
                              onTap: getImage,
                              child: Icon(
                                Icons.edit,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
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
            controller: nameCtrl,
            focusNode: nameFocus,
            validator: Helper.validateEmpty,
            onFieldSubmitted: (term) {
              Helper.fieldFocusChange(
                context,
                nameFocus,
                emailFocus,
              );
            },
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
            controller: emailCtrl,
            focusNode: emailFocus,
            validator: Helper.validateEmail,
            onFieldSubmitted: (term) {
              Helper.fieldFocusChange(
                context,
                emailFocus,
                widget.type == 'user' ? dobFocus : pwdFocus,
              );
            },
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
              ? InkWell(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                    );
                  },
                  child: DateTimeField(
                    decoration: ColorTheme.borderInput(
                      'Date Of Birth',
                      5,
                      ColorTheme.lightColor.withAlpha(80),
                      MdiIcons.calendar,
                    ),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (e) {
                      Helper.fieldFocusChange(
                        context,
                        dobFocus,
                        pwdFocus,
                      );
                    },
                    controller: dobCtrl,
                    focusNode: dobFocus,
                    format: DateFormat("dd-MM-yyyy"),
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime.now(),
                      );
                    },
                  ),
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
            validator: Helper.validateEmpty,
            textInputAction: TextInputAction.next,
            obscureText: true,
            onFieldSubmitted: (e) {
              Helper.fieldFocusChange(
                context,
                pwdFocus,
                rptFocus,
              );
            },
            controller: pwdCtrl,
            focusNode: pwdFocus,
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
            obscureText: true,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (e) {
              Helper.fieldFocusChange(
                context,
                rptFocus,
                phoneFocus,
              );
            },
            validator: Helper.validateEmpty,
            controller: rptPwdCtrl,
            focusNode: rptFocus,
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
                      600,
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
                    validator: Helper.validateEmpty,
                    controller: phoneCtrl,
                    onFieldSubmitted: (e) {
                      Helper.fieldFocusChange(
                        context,
                        phoneFocus,
                        usernameFocus,
                      );
                    },
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
            validator: Helper.validateEmpty,
            onFieldSubmitted: (e) {
              Helper.fieldFocusChange(
                context,
                usernameFocus,
                countryFocus,
              );
            },
            controller: usernameCtrl,
            focusNode: usernameFocus,
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
                      setState(() {
                        country = e.name;
                      });
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
                      600,
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
            title: 'Register'.toUpperCase(),
            hasBorder: false,
            isLoading: isLoading,
            margin: EdgeInsets.only(bottom: 10),
            onTap: () {
              register();
              // Helper.off(OTP());
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
                        Helper.off(Login());
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
