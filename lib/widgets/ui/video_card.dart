import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/circle_image.dart';

class VideoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: ColorTheme.cardDecoration(),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image.network(
                  'https://picsum.photos/300/200',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                top: 0,
                left: -30,
                height: 170,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.play_circle_filled,
                      size: 80,
                      color: Colors.black.withAlpha(150),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: CustomCircleImage(
                    height: 50,
                    width: 50,
                    shape: BoxShape.circle,
                    url: 'https://i.pravatar.cc/100',
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Christmas Celebration',
                        style: ColorTheme.secondaryHeading(),
                      ),
                      Text(
                        'Winston Church',
                        style: ColorTheme.bodySmall(
                          ColorTheme.lightColor,
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    size: 22,
                    color: ColorTheme.darkColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
