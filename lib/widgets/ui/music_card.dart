import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';

class MusicCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ColorTheme.cardDecoration(),
      margin: EdgeInsets.only(top: 0, bottom: 10, right: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 120,
              color: ColorTheme.backgroundColor,
              child: Image.asset(
                'assets/img/church_empty.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Christmas Celebration',
                        maxLines: 1,
                        style: ColorTheme.secondaryHeading(),
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
                IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    size: 22,
                    color: ColorTheme.primaryColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
