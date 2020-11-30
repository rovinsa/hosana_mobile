import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/button.dart';

class RequestDetails extends StatefulWidget {
  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
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
                      'John Doe',
                      style: ColorTheme.secondaryHeading(),
                    ),
                    Text(
                      '@john23',
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
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: ColorTheme.cardDecoration(),
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Membership Request',
                      style: ColorTheme.mainHeading(ColorTheme.darkColor, 1),
                    ),
                    Text(
                      'Feb 25, 2018 - 11:00 AM',
                      style: ColorTheme.bodyText(
                        ColorTheme.primaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Membership ID:',
                          style: ColorTheme.secondaryHeading(),
                        ),
                        Text(
                          '#2343',
                          style: ColorTheme.bodyText(ColorTheme.lightColor, 1),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Membership Proof:',
                          style: ColorTheme.secondaryHeading(),
                        ),
                        Text(
                          'View Attachment',
                          style:
                              ColorTheme.bodyText(ColorTheme.primaryColor, 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
              ),
              CustomButton(
                color: ColorTheme.primaryColor,
                title: 'Approve',
                hasBorder: false,
                height: 50,
                margin: EdgeInsets.only(bottom: 15),
                onTap: () {},
              ),
              CustomButton(
                color: Colors.red,
                title: 'Reject',
                hasBorder: true,
                height: 50,
                margin: EdgeInsets.only(bottom: 15),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
