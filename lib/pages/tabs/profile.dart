import 'package:flutter/material.dart';
import 'package:hosanna/pages/common/church_profile.dart';
import 'package:hosanna/pages/common/churches.dart';
import 'package:hosanna/pages/user/edit_profile.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/hosana_icons.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';
import 'package:hosanna/widgets/ui/church_card.dart';
import 'package:hosanna/widgets/ui/circle_image.dart';
import 'package:hosanna/widgets/ui/custom_heading.dart';
import 'package:hosanna/widgets/ui/list_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            padding: EdgeInsets.only(top: 70),
          ),
          Center(
            child: Text(
              'Hannah Doe',
              style: ColorTheme.mainHeading(
                ColorTheme.darkColor,
              ),
            ),
          ),
          CustomHeading(
            title: 'User Info',
            routeTitle: 'Edit',
            route: MaterialPageRoute(
              builder: (context) => EditProfile(),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: ColorTheme.cardDecoration(),
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                ListCard(
                  noDecoration: true,
                  title: 'Primary Church',
                  subtitle: 'Winston Church',
                  icon: Hosana.church,
                  color: Colors.green,
                ),
                ListCard(
                  noDecoration: true,
                  title: 'Email',
                  subtitle: 'jack@gamil.com',
                  icon: MdiIcons.email,
                  color: Colors.orangeAccent,
                ),
                ListCard(
                  noDecoration: true,
                  title: 'Phone',
                  subtitle: '123 34 2333',
                  icon: MdiIcons.email,
                  color: Colors.purple,
                ),
                ListCard(
                  noDecoration: true,
                  title: 'DOB',
                  subtitle: '123 34 2333',
                  icon: MdiIcons.calendarAccount,
                  color: Colors.indigoAccent,
                ),
                ListCard(
                  noDecoration: true,
                  title: 'Username',
                  subtitle: '@hannah',
                  icon: MdiIcons.bagPersonal,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          CustomHeading(
            title: 'Favorite Bible Verse',
            routeTitle: 'Edit',
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: ColorTheme.cardDecoration(),
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "“Be yourself; everyone else is already taken.”",
                    style: TextStyle(
                      color: ColorTheme.darkColor,
                      fontSize: 20,
                      fontFamily: 'cursive',
                      height: 2,
                    ),
                  ),
                  TextSpan(
                    text: "― Oscar Wilde",
                    style: ColorTheme.bodyText(),
                  ),
                ],
              ),
            ),
          ),
          CustomHeading(
            title: 'My Churches / Ministries',
            routeTitle: 'Search',
            route: MaterialPageRoute(
              builder: (context) => Churches(),
            ),
          ),
          GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.only(top: 10, bottom: 15, left: 10, right: 0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 100 / 102,
            ),
            itemBuilder: (BuildContext context, int index) {
              return ChurchCard(
                church: 'Winston Church',
                username: '@churchId',
                showControls: false,
                onTap: () {
                  Helper.to(ChurchProfile());
                },
              );
            },
          ),
          CustomButton(
            hasBorder: false,
            title: 'View All',
            height: 50,
            color: ColorTheme.primaryColor.withAlpha(50),
            margin: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 25),
            textColor: ColorTheme.primaryColor,
            onTap: () {
              Helper.to(Churches());
            },
          ),
        ],
      ),
    );
  }
}
