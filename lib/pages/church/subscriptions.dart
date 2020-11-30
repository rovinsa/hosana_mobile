import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/custom_list_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Subscriptions extends StatefulWidget {
  @override
  _SubscriptionsState createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Subscriptions',
        bgColor: Colors.white,
        brightness: Brightness.light,
        iconColor: ColorTheme.darkColor,
        isCenter: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CustomListTile(
                icon: MdiIcons.laptop,
                title: 'Current Plan',
                subtitle: 'Hosana Basic',
                color: Colors.purple,
                trailing: Text(
                  'Expiry : Feb 25',
                  style: ColorTheme.bodyText(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Container(
                height: 600,
                margin: EdgeInsets.only(bottom: 50),
                width: MediaQuery.of(context).size.width,
                decoration: ColorTheme.cardDecoration(
                  false,
                  10,
                  ColorTheme.primaryColor,
                ),
                padding: EdgeInsets.all(25),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: ColorTheme.primaryColor.withAlpha(50),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Icon(
                                MdiIcons.gift,
                                color: ColorTheme.primaryColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                          ),
                          Text(
                            'Hosana Pro',
                            style: ColorTheme.mainHeading(
                              ColorTheme.primaryColor,
                              1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$100',
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: ColorTheme.darkColor,
                                  ),
                                ),
                                TextSpan(
                                    text: '/ Month',
                                    style: ColorTheme.secondaryHeading()),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'Feature Here',
                              style: ColorTheme.bodyText(ColorTheme.lightColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'Feature Two here',
                              style: ColorTheme.bodyText(ColorTheme.lightColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'Another Feature Here',
                              style: ColorTheme.bodyText(ColorTheme.lightColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'Feature Five',
                              style: ColorTheme.bodyText(ColorTheme.lightColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'Feature Six Here',
                              style: ColorTheme.bodyText(ColorTheme.lightColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -50,
                      left: -40,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              color: ColorTheme.primaryColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                'Upgrade',
                                style: ColorTheme.bodyText(Colors.white, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
