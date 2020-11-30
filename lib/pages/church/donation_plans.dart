import 'package:flutter/material.dart';
import 'package:hosanna/pages/church/add_donation_plan.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/donation_plan_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DonationPlans extends StatefulWidget {
  @override
  _DonationPlansState createState() => _DonationPlansState();
}

class _DonationPlansState extends State<DonationPlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Donation Plans',
        bgColor: Colors.white,
        brightness: Brightness.light,
        iconColor: ColorTheme.darkColor,
        isCenter: false,
        actions: [
          FlatButton(
            child: Text(
              'Add',
              style: ColorTheme.bodyText(ColorTheme.primaryColor, 1),
            ),
            onPressed: () {
              Helper.to(AddDonationPlan());
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 10),
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return DonationPlanCard();
        },
      ),
    );
  }
}
