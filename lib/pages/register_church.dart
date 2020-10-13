import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/form/register_form.dart';

class ChurchRegister extends StatefulWidget {
  @override
  _ChurchRegisterState createState() => _ChurchRegisterState();
}

class _ChurchRegisterState extends State<ChurchRegister> {
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
              padding: EdgeInsets.fromLTRB(25, 50, 25, 25),
              color: Colors.white,
              child: RegisterForm(
                type: 'church',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
