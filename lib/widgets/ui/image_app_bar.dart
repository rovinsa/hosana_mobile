import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';

class ImageAppBar extends StatelessWidget {
// Properties
  final String title, subtitle;

// Constructor
  ImageAppBar({
    @required this.title,
    @required this.subtitle,
  });

// Builld
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/img/bg.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: ColorTheme.bodyText(Colors.white, 1),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
