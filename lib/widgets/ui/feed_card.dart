import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/hosana_icons.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/reactions.dart';

class FeedCard extends StatelessWidget {
// Properties

  final String name, text, time, userImage;
  final Function onTap;

// Constructor

  FeedCard({this.name, this.time, this.text, this.userImage, this.onTap});

// Build

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: ColorTheme.cardDecoration(),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        userImage,
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
                          name,
                          style: ColorTheme.secondaryHeading(
                              ColorTheme.darkColor, 1),
                        ),
                        Row(
                          children: [
                            Text(
                              time,
                              style: ColorTheme.bodySmall(
                                  ColorTheme.lightColor, 1.5),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Icon(
                                Hosana.globe,
                                size: 12,
                                color: ColorTheme.lightColor,
                              ),
                            ),
                          ],
                        ),
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
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy  … text ever since the 1500s',
                style: ColorTheme.bodyText(
                  ColorTheme.darkColor,
                  1.5,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      child: ExtendedImage.network(
                        'https://picsum.photos/300/201',
                        fit: BoxFit.fill,
                        cache: true,
                        shape: BoxShape.rectangle,
                        height: 180,
                        //cancelToken: cancellationToken,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      child: ExtendedImage.network(
                        'https://picsum.photos/300/202',
                        fit: BoxFit.fill,
                        cache: true,
                        shape: BoxShape.rectangle,
                        height: 180,

                        //cancelToken: cancellationToken,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Reactions(),
          ],
        ),
      ),
    );
  }
}
