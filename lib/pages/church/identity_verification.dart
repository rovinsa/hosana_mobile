import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/Strings.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IdentityVerification extends StatefulWidget {
  @override
  _IdentityVerificationState createState() => _IdentityVerificationState();
}

class _IdentityVerificationState extends State<IdentityVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Identity Verification',
        bgColor: Colors.white,
        brightness: Brightness.light,
        iconColor: ColorTheme.darkColor,
        isCenter: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: ColorTheme.cardDecoration(),
              child: Column(
                children: [
                  TextFormField(
                    decoration: ColorTheme.borderInput(
                      'Church Name',
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
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                  ),
                  TextFormField(
                    decoration: ColorTheme.borderInput(
                      'Registration No',
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
                      'Address',
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
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorTheme.primaryColor.withAlpha(50),
                          ),
                          child: Center(
                            child: Icon(
                              MdiIcons.cloud,
                              color: ColorTheme.primaryColor,
                            ),
                          ),
                          margin: EdgeInsets.only(right: 15),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Registration Proof',
                              style: ColorTheme.secondaryHeading(),
                            ),
                            Text(
                              'Upload supporting document ',
                              style: ColorTheme.bodyText(
                                  ColorTheme.lightColor, 1.4),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                  ),
                  Text(
                    Strings.lorem,
                    style: ColorTheme.bodyText(ColorTheme.lightColor, 1.5),
                    maxLines: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                ],
              ),
            ),
            CustomButton(
              color: ColorTheme.primaryColor,
              title: 'Submit',
              hasBorder: false,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 15),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
