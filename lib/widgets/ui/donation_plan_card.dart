import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DonationPlanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      decoration: ColorTheme.cardDecoration(),
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: ColorTheme.primaryColor.withAlpha(50),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Icon(
                Icons.attach_money,
                color: ColorTheme.primaryColor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Plan Title',
              style: ColorTheme.secondaryHeading(),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  MdiIcons.pencil,
                  color: Colors.orange,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  MdiIcons.delete,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
