import 'package:flutter/material.dart';
import 'package:hosanna/widgets/ui/empty_events_card.dart';

class PastEvents extends StatefulWidget {
  @override
  _PastEventsState createState() => _PastEventsState();
}

class _PastEventsState extends State<PastEvents> {
  @override
  Widget build(BuildContext context) {
    return EmptyEventCard();
  }
}
