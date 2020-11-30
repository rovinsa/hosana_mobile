import 'package:flutter/material.dart';
import 'package:hosanna/widgets/ui/event_card.dart';

class UpcomingEvents extends StatefulWidget {
  @override
  _UpcomingEventsState createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      itemBuilder: (BuildContext context, int index) {
        return EventCard();
      },
    );
  }
}
