import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/button.dart';
import 'package:hosanna/widgets/ui/custom_heading.dart';

class AddDonationPlan extends StatefulWidget {
  @override
  _AddDonationPlanState createState() => _AddDonationPlanState();
}

class _AddDonationPlanState extends State<AddDonationPlan> {
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
                      'Church Name',
                      style: ColorTheme.secondaryHeading(),
                    ),
                    Text(
                      '@churchid',
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
                title: 'Add Donation Plan',
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                padding: EdgeInsets.all(25),
                decoration: ColorTheme.cardDecoration(),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: ColorTheme.borderInput(
                        'Title',
                        5,
                        ColorTheme.lightColor,
                        null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                    ),
                    TextFormField(
                      decoration: ColorTheme.borderInput(
                        'Description',
                        5,
                        ColorTheme.lightColor,
                        null,
                      ),
                      maxLines: 15,
                      minLines: 10,
                    ),
                  ],
                ),
              ),
              CustomButton(
                color: ColorTheme.primaryColor,
                hasBorder: false,
                title: 'Add',
                height: 50,
                margin: EdgeInsets.all(0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
