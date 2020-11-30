import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';

class MemberCard extends StatelessWidget {
// Properteis
  final String image, name, username;
  final bool showControls;
  final Function onTap;

// Constructor

  MemberCard({
    this.image,
    this.name,
    this.username,
    this.showControls,
    this.onTap,
  });

// Build
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: ColorTheme.cardDecoration(),
        margin: EdgeInsets.only(top: 0, bottom: 10, right: 10),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    color: ColorTheme.backgroundColor,
                    child: image != null
                        ? ExtendedImage.network(
                            image,
                            fit: BoxFit.cover,
                            cache: true,
                            border: Border.all(color: Colors.red, width: 1.0),
                            //cancelToken: cancellationToken,
                          )
                        : Image.asset(
                            'assets/img/church_empty.png',
                            fit: BoxFit.fitWidth,
                          ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            style: ColorTheme.secondaryHeading(
                              ColorTheme.darkColor,
                              2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            username,
                            style: ColorTheme.bodySmall(
                              ColorTheme.lightColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            showControls
                ? Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      width: 35,
                      height: 35,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 18,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  )
                : Container(
                    width: 0,
                    height: 0,
                  ),
          ],
        ),
      ),
    );
  }
}
