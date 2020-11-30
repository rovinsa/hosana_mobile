import 'package:flutter/material.dart';
import 'package:hosanna/widgets/form/register_form.dart';
import 'package:hosanna/widgets/ui/image_app_bar.dart';

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
            ImageAppBar(
              title: 'Hello',
              subtitle: 'Register as User',
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
