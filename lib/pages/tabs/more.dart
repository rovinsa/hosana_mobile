import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosanna/controllers/app_ctrl.dart';
import 'package:hosanna/model/user.dart';
import 'package:hosanna/pages/church/church_admins.dart';
import 'package:hosanna/pages/church/donation_plans.dart';
import 'package:hosanna/pages/church/identity_verification.dart';
import 'package:hosanna/pages/church/member_requests.dart';
import 'package:hosanna/pages/church/subscriptions.dart';
import 'package:hosanna/pages/common/login.dart';
import 'package:hosanna/pages/common/prayer_requests.dart';
import 'package:hosanna/pages/common/transactions.dart';
import 'package:hosanna/pages/user/change_password.dart';
import 'package:hosanna/utlilities/Strings.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/loader.dart';
import 'package:hosanna/utlilities/request.dart';
import 'package:hosanna/utlilities/shared_pref_manager.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
// Properties
  User user;
  final AppController appCtrl = Get.find();

// Init state

  @override
  void initState() {
    super.initState();
    SharedPrefManager.getUser().then((userData) {
      user = userData;
    });
  }
// Logout User
  Future logout() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      appCtrl.isLoading = true;
    });

    Request request = Request(Strings.baseURL + Strings.logout, null, null);
    request.post().then((response) {
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          appCtrl.isLoading = false;
        });
      } else {
        setState(() {
          appCtrl.isLoading = false;
        });
        print(response.data);
        Helper.showMessage(response.data['message'], context);
      }

      Helper.off(Login());
    });
  }

// Build

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: ColorTheme.cardDecoration(),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                MdiIcons.message,
                color: ColorTheme.primaryColor,
              ),
              title: Text(
                'My Prayer Requests',
                style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
              onTap: () {
                Helper.to(PrayerRequests());
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.wallet,
                color: ColorTheme.primaryColor,
              ),
              title: Text(
                'My Transactions',
                style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
              onTap: () {
                Helper.to(Transactions());
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.listStatus,
                color: ColorTheme.primaryColor,
              ),
              title: Text(
                'Member Requests',
                style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
              onTap: () {
                Helper.to(MemberRequests());
              },
            ),
            ListTile(
              leading: Icon(
                MdiIcons.package,
                color: ColorTheme.primaryColor,
              ),
              title: Text(
                'Subscriptions',
                style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
              ),
              trailing: Icon(
                Icons.chevron_right,
              ),
              onTap: () {
                Helper.to(Subscriptions());
              },
            ),
            ExpansionTile(
              title: Row(
                children: [
                  Icon(
                    MdiIcons.cog,
                    color: ColorTheme.primaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32),
                  ),
                  Text(
                    'Settings',
                    style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                  ),
                ],
              ),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          MdiIcons.lock,
                          color: ColorTheme.primaryColor,
                        ),
                        title: Text(
                          'Change Password',
                          style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () {
                          Helper.to(ChangePassword());
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.language,
                          color: ColorTheme.primaryColor,
                        ),
                        title: Text(
                          'Change Language',
                          style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(
                          MdiIcons.accountGroup,
                          color: ColorTheme.primaryColor,
                        ),
                        title: Text(
                          'Manage Admins',
                          style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () {
                          Helper.to(Admins());
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          MdiIcons.flower,
                          color: ColorTheme.primaryColor,
                        ),
                        title: Text(
                          'Donation Plans',
                          style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () {
                          Helper.to(DonationPlans());
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.verified_user,
                          color: ColorTheme.primaryColor,
                        ),
                        title: Text(
                          'Identity Verification',
                          style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () {
                          Helper.to(IdentityVerification());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Row(
                children: [
                  Icon(
                    MdiIcons.lifebuoy,
                    color: ColorTheme.primaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32),
                  ),
                  Text(
                    'Help & Support',
                    style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                  ),
                ],
              ),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          MdiIcons.information,
                          color: ColorTheme.primaryColor,
                        ),
                        title: Text(
                          'About',
                          style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(
                          MdiIcons.bug,
                          color: ColorTheme.primaryColor,
                        ),
                        title: Text(
                          'Report a problem',
                          style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(
                          MdiIcons.fileDocument,
                          color: ColorTheme.primaryColor,
                        ),
                        title: Text(
                          'Terms & Policies',
                          style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(
                          MdiIcons.mail,
                          color: ColorTheme.primaryColor,
                        ),
                        title: Text(
                          'Contact Us',
                          style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                MdiIcons.logout,
                color: ColorTheme.primaryColor,
              ),
              title: Text(
                'Logout',
                style: ColorTheme.bodyText(ColorTheme.darkColor, 1),
              ),
              onTap: () {
                logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
