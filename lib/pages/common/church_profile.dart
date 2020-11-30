import 'package:flutter/material.dart';
import 'package:hosanna/pages/church/members.dart';
import 'package:hosanna/pages/church/resources.dart';
import 'package:hosanna/pages/common/prayer_request_form.dart';
import 'package:hosanna/pages/media/music.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/hosana_icons.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/button.dart';
import 'package:hosanna/widgets/ui/circle_image.dart';
import 'package:hosanna/widgets/ui/custom_heading.dart';
import 'package:hosanna/widgets/ui/list_card.dart';
import 'package:hosanna/widgets/ui/stat_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChurchProfile extends StatefulWidget {
  @override
  _ChurchProfileState createState() => _ChurchProfileState();
}

class _ChurchProfileState extends State<ChurchProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Church Profile',
        bgColor: Colors.white,
        brightness: Brightness.light,
        iconColor: ColorTheme.darkColor,
        isCenter: false,
        actions: [
          IconButton(
            icon: Icon(
              MdiIcons.dotsVertical,
              color: ColorTheme.darkColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Image.network(
                      'https://picsum.photos/300',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    right: 15,
                    bottom: 15,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        icon: Icon(
                          MdiIcons.camera,
                          color: ColorTheme.primaryColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: -60,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            child: CustomCircleImage(
                              height: 140,
                              width: 140,
                              shape: BoxShape.circle,
                              url: 'https://i.pravatar.cc/100',
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: ColorTheme.primaryColor,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Icon(
                                MdiIcons.camera,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
            ),
            Padding(
              padding: EdgeInsets.only(top: 45),
            ),
            Center(
              child: Text(
                'Winston Church',
                style: ColorTheme.mainHeading(
                  ColorTheme.darkColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                children: [
                  StatCard(
                    color: ColorTheme.primaryColor,
                    title: 'Members',
                    value: '20K',
                    icon: Hosana.award,
                    onTap: () {
                      Helper.to(Members());
                    },
                  ),
                  StatCard(
                    color: ColorTheme.yellow,
                    title: 'Followers',
                    value: '15K',
                    icon: Hosana.award,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
              child: Row(
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
            ),
            CustomHeading(
              title: 'Details',
            ),
            ListCard(
              title: 'Website',
              subtitle: 'https://google.com',
              color: Colors.purple,
              icon: MdiIcons.laptop,
              showArrow: true,
            ),
            ListCard(
              title: 'Phone',
              subtitle: '223 3323 332',
              color: Colors.blue,
              icon: MdiIcons.phone,
              showArrow: true,
            ),
            ListCard(
              title: 'Address',
              subtitle: 'Auckland, AK, NZ',
              color: Colors.orange,
              icon: MdiIcons.navigation,
              showArrow: true,
            ),
            ListCard(
              title: 'Username',
              subtitle: '@church',
              color: Colors.green,
              icon: MdiIcons.cardPlus,
              showArrow: true,
            ),
            CustomHeading(
              title: 'Social',
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: ColorTheme.cardDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      MdiIcons.facebook,
                      color: ColorTheme.blue,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      MdiIcons.youtube,
                      color: ColorTheme.red,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      MdiIcons.twitter,
                      color: Colors.blue,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      MdiIcons.instagram,
                      color: Colors.pinkAccent,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            CustomHeading(
              title: 'Activities',
            ),
            Container(
              decoration: ColorTheme.cardDecoration(),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ListCard(
                    noDecoration: true,
                    title: 'Donate',
                    icon: MdiIcons.wallet,
                    color: ColorTheme.primaryColor,
                    showArrow: true,
                  ),
                  ListCard(
                    noDecoration: true,
                    title: 'Request for prayer',
                    icon: Hosana.pray,
                    color: ColorTheme.primaryColor,
                    showArrow: true,
                    onTap: () {
                      Helper.to(RequestPrayer());
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      color: Colors.grey[400],
                      height: 2,
                    ),
                  ),
                  ListCard(
                    noDecoration: true,
                    title: 'Posts',
                    icon: MdiIcons.post,
                    color: Colors.purple,
                    showArrow: true,
                  ),
                  ListCard(
                    noDecoration: true,
                    title: 'Events',
                    icon: MdiIcons.calendar,
                    color: Colors.orange,
                    showArrow: true,
                  ),
                  ListCard(
                    noDecoration: true,
                    title: 'Photos',
                    icon: MdiIcons.image,
                    color: Colors.indigo,
                    showArrow: true,
                  ),
                  ListCard(
                    noDecoration: true,
                    title: 'Videos',
                    icon: MdiIcons.video,
                    color: Colors.blue,
                    showArrow: true,
                  ),
                  ListCard(
                    noDecoration: true,
                    title: 'Music',
                    icon: MdiIcons.music,
                    color: Colors.green,
                    showArrow: true,
                    onTap: () {
                      Helper.to(MusicPage(
                        asPage: true,
                      ));
                    },
                  ),
                  ListCard(
                    noDecoration: true,
                    title: 'Resources',
                    icon: MdiIcons.folder,
                    color: Colors.amber,
                    showArrow: true,
                    onTap: () {
                      Helper.to(Resources());
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
            ),
          ],
        ),
      ),
    );
  }
}
