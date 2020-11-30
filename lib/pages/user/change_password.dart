import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Change Password',
        bgColor: Colors.white,
        brightness: Brightness.light,
        iconColor: ColorTheme.darkColor,
        isCenter: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: ColorTheme.primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          decoration: ColorTheme.cardDecoration(),
          child: Column(
            children: [
              TextFormField(
                decoration: ColorTheme.borderInput(
                  'Old Password',
                  5,
                  ColorTheme.lightColor.withAlpha(80),
                  MdiIcons.lock,
                ),
                obscureText: true,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (e) {},
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
              ),
              TextFormField(
                decoration: ColorTheme.borderInput(
                  'New Password',
                  5,
                  ColorTheme.lightColor.withAlpha(80),
                  MdiIcons.lock,
                ),
                obscureText: true,
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
                obscureText: true,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (e) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
