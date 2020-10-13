import 'package:flutter/material.dart';

import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/form/register_form.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 240,
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/img/bg.png',
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: SafeArea(
                child: AppBar(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello',
                        style: ColorTheme.bodyText(Colors.white, 1),
                      ),
                      Text(
                        'Register',
                        style: ColorTheme.mainHeading(Colors.white, 1.3),
                      ),
                    ],
                  ),
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: RegisterForm(
                type: 'user',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
