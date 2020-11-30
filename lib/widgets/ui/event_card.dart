import 'package:flutter/material.dart';
import 'package:hosanna/pages/events/event_details.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/theme.dart';

import 'button.dart';

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: ColorTheme.cardDecoration(),
      child: InkWell(
        onTap: () {
          Helper.to(
            EventDetails(),
          );
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
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
                          'SUN, AT 11:00 AM – 12:00 PM',
                          style: ColorTheme.bodySmall(ColorTheme.primaryColor),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                        Text(
                          'Christmas Celebration',
                          style: ColorTheme.secondaryHeading(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                        Text(
                          'Winston Church',
                          style: ColorTheme.bodySmall(
                            ColorTheme.lightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 55,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withAlpha(30),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '11',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'OCT'.toUpperCase(),
                          style: ColorTheme.bodySmall(
                            ColorTheme.darkColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.only(top: 15),
              child: Image.network(
                'https://picsum.photos/300',
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          CustomButton(
                            color: ColorTheme.success,
                            hasBorder: true,
                            title: 'Accept',
                            margin: EdgeInsets.only(right: 5),
                            onTap: () {},
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                          ),
                          CustomButton(
                            color: ColorTheme.warning,
                            hasBorder: false,
                            title: 'Maybe',
                            margin: EdgeInsets.only(right: 5),
                            onTap: () {},
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                          ),
                          CustomButton(
                            color: ColorTheme.red,
                            hasBorder: true,
                            title: 'Reject',
                            margin: EdgeInsets.only(right: 5),
                            onTap: () {},
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            child: CircleAvatar(
                              minRadius: 20,
                              backgroundImage: NetworkImage(
                                'https://i.pravatar.cc/111',
                              ),
                              backgroundColor: Colors.grey[200],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 25),
                            child: CircleAvatar(
                              minRadius: 20,
                              backgroundImage: NetworkImage(
                                'https://i.pravatar.cc/121',
                              ),
                              backgroundColor: Colors.grey[200],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 50),
                            child: CircleAvatar(
                              minRadius: 20,
                              child: Text(
                                '+25',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: ColorTheme.primaryColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
