import 'package:flutter/material.dart';
import 'package:hosanna/pages/events/ongoing.dart';
import 'package:hosanna/pages/events/past.dart';
import 'package:hosanna/pages/events/upcoming.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            TabBar(
              indicatorColor: ColorTheme.primaryColor,
              unselectedLabelColor: ColorTheme.lightColor,
              labelColor: ColorTheme.primaryColor,
              labelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
              tabs: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.clockOutline,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Ongoing'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric( vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.calendarOutline,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Upcoming'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 15),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.history,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Past'),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: ColorTheme.backgroundColor,
                child: TabBarView(
                  children: [
                    OngoingEvents(),
                    UpcomingEvents(),
                    PastEvents(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
