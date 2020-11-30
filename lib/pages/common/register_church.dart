import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/form/register_form.dart';
import 'package:hosanna/widgets/ui/image_app_bar.dart';

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
            ImageAppBar(
              title: 'Hello',
              subtitle: 'Register as Admin',
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 30, 15, 50),
                  child: Image.asset(
                    'assets/img/logo_v.png',
                    width: 200,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 25),
                  color: Colors.white,
                  child: RegisterForm(
                    type: 'church',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
