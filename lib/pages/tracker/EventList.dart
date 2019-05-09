import "package:flutter/material.dart";
import 'package:mood_app/models/Event.dart';
import 'package:mood_app/pages/tracker/EventCard.dart';

class EventList extends StatefulWidget {
  _eventListState createState() => _eventListState();
}

class _eventListState extends State<EventList> {
  static final List<Event> dummyEvents = [
    Event("Event", "NOtes ntoes", 4, 1554748182661),
    Event("Event", "NOtes ntoes", 1, 1554748182661),
    Event("Event", "NOtes ntoes", 5, 1554748182661),
    Event("Event", "NOtes ntoes", 3, 1554748182661),
    Event("Event", "NOtes ntoes", 2, 1554748182661),
  ];

  final List<EventCard> eventsCards =
      dummyEvents.map((event) => EventCard(event)).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
     padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
      child:


      ListView.builder(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: eventsCards.length,
        itemBuilder: (BuildContext context, int index) {
          return eventsCards[index];
        },
      ),
    );
  }
}
