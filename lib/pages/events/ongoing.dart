import 'package:flutter/material.dart';
import 'package:hosanna/widgets/ui/empty_events_card.dart';

class OngoingEvents extends StatefulWidget {
  @override
  _OngoingEventsState createState() => _OngoingEventsState();
}

class _OngoingEventsState extends State<OngoingEvents> {
  @override
  Widget build(BuildContext context) {
    return EmptyEventCard();
  }
}
