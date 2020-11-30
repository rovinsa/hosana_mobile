import 'package:flutter/material.dart';
import 'package:hosanna/pages/church/member_request_details.dart';
import 'package:hosanna/utlilities/helper.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/circle_image.dart';

class MemberRequests extends StatefulWidget {
  @override
  _MemberRequestsState createState() => _MemberRequestsState();
}

class _MemberRequestsState extends State<MemberRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Member Requests',
        bgColor: Colors.white,
        brightness: Brightness.light,
        iconColor: ColorTheme.darkColor,
        isCenter: false,
      ),
      body: ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Helper.to(RequestDetails());
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: ColorTheme.cardDecoration(),
              child: Container(
                padding: EdgeInsets.all(15),
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
                            'John Doe',
                            style: ColorTheme.secondaryHeading(),
                          ),
                          Text(
                            '@john123',
                            style: ColorTheme.bodyText(
                              ColorTheme.lightColor,
                              1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
