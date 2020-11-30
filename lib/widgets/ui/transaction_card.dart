import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'label.dart';

class TransactionCard extends StatelessWidget {
// Properties

  final String church, dateTime, plan, amount;
  final Function onTap;
  final Color color;

// Constructor

  TransactionCard({
    this.church,
    this.dateTime,
    this.plan,
    this.amount,
    this.onTap,
    this.color,
  });

// Build
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: ColorTheme.cardDecoration(),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.withAlpha(30),
                  ),
                  child: Center(
                    child: Icon(
                      MdiIcons.wallet,
                      size: 20,
                      color: color,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      church,
                      style: ColorTheme.secondaryHeading(),
                    ),
                    Text(
                      plan,
                      style: ColorTheme.bodyText(
                        ColorTheme.primaryColor,
                        1.5,
                      ),
                    ),
                    Text(
                      dateTime,
                      style: ColorTheme.bodySmall(
                        ColorTheme.lightColor,
                        1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                amount,
                style: ColorTheme.secondaryHeading(
                  ColorTheme.darkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
