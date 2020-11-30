import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';

class ChurchCard extends StatelessWidget {
// Properteis
  final String image, church, username;
  final bool showControls;
  final Function onTap;

// Constructor

  ChurchCard({
    this.image,
    this.church,
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
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 120,
                color: ColorTheme.backgroundColor,
                child: image != null
                    ? ExtendedImage.network(
                        image,
                        fit: BoxFit.fill,
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
                        'Winston Church',
                        maxLines: 1,
                        style: ColorTheme.secondaryHeading(
                          ColorTheme.darkColor,
                          2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '@churchId',
                        style: ColorTheme.bodySmall(
                          ColorTheme.lightColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            showControls != null && showControls
                ? Container(
                    padding: EdgeInsets.only(top: 15),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomButton(
                            hasBorder: false,
                            color: ColorTheme.primaryColor,
                            title: 'Member',
                            margin: EdgeInsets.only(right: 10),
                            height: 40,
                            padding: EdgeInsets.all(5),
                            onTap: () {},
                          ),
                        ),
                        Expanded(
                          child: CustomButton(
                            hasBorder: true,
                            color: ColorTheme.primaryColor,
                            title: 'Follow',
                            height: 40,
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(right: 0),
                            onTap: () {},
                          ),
                        ),
                      ],
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
