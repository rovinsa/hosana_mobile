import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Edit Info',
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
                          style: ColorTheme.bodyText(ColorTheme.lightColor, 1),
                          decoration: InputDecoration.collapsed(
                            hintText: 'Select Gender',
                          ),
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
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
              ),
              TextFormField(
                decoration: ColorTheme.borderInput(
                  'Date Of Birth',
                  5,
                  ColorTheme.lightColor.withAlpha(80),
                  MdiIcons.calendar,
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
            ],
          ),
        ),
      ),
    );
  }
}
