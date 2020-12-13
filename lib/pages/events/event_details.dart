import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/Strings.dart';
import 'package:hosanna/utlilities/hosana_icons.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/button.dart';
import 'package:hosanna/widgets/ui/custom_heading.dart';
import 'package:hosanna/widgets/ui/custom_list_tile.dart';
import 'package:hosanna/widgets/ui/list_card.dart';
import 'package:hosanna/widgets/ui/reactions.dart';
import 'package:hosanna/widgets/ui/stat_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:hosanna/model/post.dart';
import 'package:hosanna/utlilities/helper.dart';

class EventDetails extends StatefulWidget {
  PostModel post;

  EventDetails(this.post);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: ColorTheme.darkColor),
        centerTitle: false,
        title: Text(
          'Event Details',
          style: ColorTheme.mainHeading(
            ColorTheme.darkColor,
            1,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/100',
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
                              "${Helper.getDayNameDate(widget.post.date??"")} AT ${widget.post.startTime??""} - ${widget.post.endTime??""}",
                              // 'SUN, AT 11:00 AM – 12:00 PM',
                              style:
                                  ColorTheme.bodySmall(ColorTheme.primaryColor),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 5),
                            ),
                            Text(
                              widget.post.title??'Christmas Celebration',
                              style: ColorTheme.secondaryHeading(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 5),
                            ),
                            Text(
                              widget.post.address??'Winston Church',
                              style: ColorTheme.bodySmall(
                                ColorTheme.lightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 50,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withAlpha(30),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              Helper.getDayDigit2(widget.post.date),
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              Helper.getMonthName2(widget.post.date).toUpperCase(),
                              style: ColorTheme.bodySmall(
                                ColorTheme.darkColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  margin: EdgeInsets.only(top: 15),
                  child: Image.network(
                    'https://picsum.photos/300',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                CustomHeading(
                  title: 'Details',
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.all(25),
                  decoration: ColorTheme.cardDecoration(),
                  child: Text(
                    Strings.lorem,
                    style: ColorTheme.bodyText(),
                  ),
                ),
                CustomHeading(
                  title: 'Attendees',
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.5),
                  child: Row(
                    children: [
                      StatCard(
                        title: 'Going',
                        value: '45',
                        color: ColorTheme.success,
                      ),
                      StatCard(
                        title: 'Maybe',
                        value: '30',
                        color: ColorTheme.yellow,
                      ),
                      StatCard(
                        title: 'Reject',
                        value: '12',
                        color: ColorTheme.red,
                      ),
                    ],
                  ),
                ),
                CustomHeading(
                  title: 'Additional Info',
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.all(10),
                  decoration: ColorTheme.cardDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListCard(
                        icon: Hosana.church,
                        title: 'Organizer',
                        subtitle: 'Winston Church',
                        color: Colors.orange,
                        noDecoration: true,
                        showArrow: true,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      ListCard(
                        icon: MdiIcons.email,
                        title: 'Date & Time',
                        subtitle: 'Jun 15 , 2:00pm - 8:00 pm BST',
                        color: Colors.purple,
                        noDecoration: true,
                        showArrow: true,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      ListCard(
                        icon: MdiIcons.navigation,
                        title: 'Location',
                        subtitle: 'Street 2, Main Boulevard, CA ',
                        color: Colors.indigo,
                        noDecoration: true,
                        showArrow: true,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 25,
            left: 25,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: ColorTheme.primaryColor,
                ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          'Accept',
                          style: ColorTheme.bodyText(
                            ColorTheme.darkColor,
                            1,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          'Maybe',
                          style: ColorTheme.bodyText(
                            ColorTheme.darkColor,
                            1,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          'Reject',
                          style: ColorTheme.bodyText(
                            ColorTheme.darkColor,
                            1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
