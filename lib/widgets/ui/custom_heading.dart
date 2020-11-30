import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';

class CustomHeading extends StatelessWidget {
  final String title, routeTitle, subtitle;
  final MaterialPageRoute route;

  const CustomHeading(
      {Key key,
      @required this.title,
      this.route,
      this.routeTitle,
      this.subtitle})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style:
                                ColorTheme.mainHeading(ColorTheme.darkColor, 1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                          ),
                          subtitle != null
                              ? Text(
                                  subtitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              : Container(),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 5,
                  child: Container(
                    width: 20,
                    height: 5,
                    decoration: BoxDecoration(
                      color: ColorTheme.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
          routeTitle != null
              ? FlatButton(
                  child: Text(
                    routeTitle.toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, route);
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
