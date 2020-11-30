import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosanna/controllers/app_ctrl.dart';
import 'package:hosanna/controllers/menu_ctrl.dart';
import 'package:hosanna/pages/church/add_post.dart';
import 'package:hosanna/pages/common/notifications.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/loader.dart';
import 'package:hosanna/utlilities/shared_pref_manager.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/custom_heading.dart';
import 'package:hosanna/widgets/ui/list_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
// Properties
  final MenuController menuCtrl = Get.put(MenuController());
  final AppController appCtrl = Get.put(AppController());
  bool isAdmin = false;

// Is Admin

  isAdminLogged() async {
    await SharedPrefManager.getUser().then((user) {
      if (user.type == 'church') {
        setState(() {
          isAdmin = true;
        });
      } else {
        setState(() {
          isAdmin = false;
        });
      }
    });
  }

// Init state

  @override
  void initState() {
    super.initState();
    appCtrl.getPostTypes();
    isAdminLogged();
  }

// Build
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuController>(
      init: MenuController(),
      builder: (_) {
        return GetBuilder<AppController>(
          init: AppController(),
          builder: (appCtrl) {
            return Loader(
              inAsyncCall: appCtrl.isLoading,
              child: Scaffold(
                appBar: AppBar(
                  brightness: Brightness.light,
                  title: Image.asset(
                    'assets/img/text_logo.png',
                    width: 120,
                  ),
                  elevation: 0.5,
                  centerTitle: false,
                  backgroundColor: Colors.white,
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 25,
                        color: ColorTheme.primaryColor,
                      ),
                      onPressed: () {},
                    ),
                    Stack(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.notifications,
                            size: 25,
                            color: ColorTheme.primaryColor,
                          ),
                          onPressed: () {
                            Helper.to(Notifications());
                          },
                        ),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                '02',
                                style: ColorTheme.bodySmall(
                                  Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                body: _.activePage,
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _.index,
                  onTap: (tab) {
                    _.setActivePage(tab);
                  },
                  type: BottomNavigationBarType.fixed,
                  items: [
                    /******  1. Home *****/
                    BottomNavigationBarItem(
                      icon: Icon(
                        MdiIcons.home,
                        color: _.index == 0
                            ? ColorTheme.primaryColor
                            : ColorTheme.lightColor,
                      ),
                      title: Text(
                        'Home',
                        style: ColorTheme.bodyText(
                          _.index == 0
                              ? ColorTheme.primaryColor
                              : ColorTheme.lightColor,
                          1,
                        ),
                      ),
                    ),
                    /******  2. Events *****/
                    BottomNavigationBarItem(
                      icon: Icon(
                        MdiIcons.calendar,
                        color: _.index == 1
                            ? ColorTheme.primaryColor
                            : ColorTheme.lightColor,
                      ),
                      title: Text(
                        'Events',
                        style: ColorTheme.bodyText(
                          _.index == 1
                              ? ColorTheme.primaryColor
                              : ColorTheme.lightColor,
                          1,
                        ),
                      ),
                    ),
                    /******  3. Media *****/
                    BottomNavigationBarItem(
                      icon: Icon(
                        MdiIcons.movieFilter,
                        color: _.index == 2
                            ? ColorTheme.primaryColor
                            : ColorTheme.lightColor,
                      ),
                      title: Text(
                        'Media',
                        style: ColorTheme.bodyText(
                          _.index == 2
                              ? ColorTheme.primaryColor
                              : ColorTheme.lightColor,
                          1,
                        ),
                      ),
                    ),
                    /******  4. Profile *****/
                    BottomNavigationBarItem(
                      icon: Icon(
                        MdiIcons.account,
                        color: _.index == 3
                            ? ColorTheme.primaryColor
                            : ColorTheme.lightColor,
                      ),
                      title: Text(
                        'Profile',
                        style: ColorTheme.bodyText(
                          _.index == 3
                              ? ColorTheme.primaryColor
                              : ColorTheme.lightColor,
                          1,
                        ),
                      ),
                    ),
                    /******  5. More *****/
                    BottomNavigationBarItem(
                      icon: Icon(
                        MdiIcons.dotsHorizontal,
                        color: _.index == 4
                            ? ColorTheme.primaryColor
                            : ColorTheme.lightColor,
                      ),
                      title: Text(
                        'More',
                        style: ColorTheme.bodyText(
                          _.index == 4
                              ? ColorTheme.primaryColor
                              : ColorTheme.lightColor,
                          1,
                        ),
                      ),
                    ),
                  ],
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endFloat,
                floatingActionButton: isAdmin
                    ? _.index == 4
                        ? null
                        : FloatingActionButton(
                            onPressed: () {
                              Get.bottomSheet(Container(
                                decoration: ColorTheme.cardDecoration(),
                                padding: EdgeInsets.all(15),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 15,
                                        ),
                                        child: CustomHeading(
                                          title: 'Add Post',
                                        ),
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: ClampingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemCount: appCtrl.postTypes.length,
                                        itemBuilder: (context, index) {
                                          return ListCard(
                                              title: appCtrl
                                                  .postTypes[index].title,
                                              color: index == 0
                                                  ? Colors.red
                                                  : index == 1
                                                      ? Colors.purple
                                                      : index == 2
                                                          ? Colors.indigo
                                                          : index == 3
                                                              ? Colors.indigo
                                                              : index == 4
                                                                  ? Colors
                                                                      .indigo
                                                                  : index == 5
                                                                      ? Colors
                                                                          .orange
                                                                      : index == 6
                                                                          ? Colors
                                                                              .indigo
                                                                          : ColorTheme
                                                                              .primaryColor,
                                              icon: index == 0
                                                  ? MdiIcons.post
                                                  : index == 1
                                                      ? MdiIcons.calendarEdit
                                                      : index == 2
                                                          ? MdiIcons.image
                                                          : index == 3
                                                              ? MdiIcons.video
                                                              : index == 4
                                                                  ? MdiIcons
                                                                      .music
                                                                  : index == 5
                                                                      ? MdiIcons
                                                                          .tuneVariant
                                                                      : index == 6
                                                                          ? MdiIcons
                                                                              .attachment
                                                                          : MdiIcons
                                                                              .file,
                                              showArrow: true,
                                              noDecoration: true,
                                              onTap: () {
                                                Navigator.pop(context);
                                                Helper.to(
                                                  AddPost(
                                                    type: appCtrl
                                                        .postTypes[index].title,
                                                    typeId: appCtrl
                                                        .postTypes[index].id
                                                        .toString(),
                                                  ),
                                                );
                                              });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                            },
                            isExtended: true,
                            backgroundColor: ColorTheme.primaryColor,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          )
                    : Container(),
              ),
            );
          },
        );
      },
    );
  }
}
