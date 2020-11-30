import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';
import 'package:hosanna/widgets/ui/custom_heading.dart';

class RequestPrayer extends StatefulWidget {
  @override
  _RequestPrayerState createState() => _RequestPrayerState();
}

class _RequestPrayerState extends State<RequestPrayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: ColorTheme.darkColor),
        title: Container(
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/100',
                  ),
                  backgroundColor: ColorTheme.primaryColor,
                ),
                margin: EdgeInsets.only(right: 10),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Winston Church',
                      style: ColorTheme.secondaryHeading(),
                    ),
                    Text(
                      '@churchId',
                      style: ColorTheme.bodySmall(
                        ColorTheme.lightColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              CustomHeading(
                title: 'Send Prayer Request',
              ),
              Container(
                decoration: ColorTheme.cardDecoration(),
                padding: EdgeInsets.all(15),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: ColorTheme.borderInput(
                          'Subject',
                          5,
                          ColorTheme.lightColor.withAlpha(80),
                          null,
                        ),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (e) {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                      ),
                      TextFormField(
                        decoration: ColorTheme.borderInput(
                          'Enter Prayer',
                          5,
                          ColorTheme.lightColor.withAlpha(80),
                          null,
                        ),
                        minLines: 12,
                        maxLines: 15,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (e) {},
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
              ),
              CustomButton(
                color: ColorTheme.primaryColor,
                title: 'Send'.toUpperCase(),
                hasBorder: false,
                margin: EdgeInsets.only(bottom: 10),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
