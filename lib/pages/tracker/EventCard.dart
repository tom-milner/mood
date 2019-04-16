import "package:flutter/material.dart";
import 'package:mood_app/models/Event.dart';
import 'package:intl/intl.dart';
import "package:mood_app/ui/theme.dart";


class EventCard extends StatelessWidget {
  final Event event;
  static const Radius BORDER_RADIUS = Radius.circular(12);
  EventCard(this.event);

  _makeListTile(BuildContext context, Event event) {

    // get time as milliseconds from epoch
    var dateTime = event.getDateTime();
    // format date using en_GB Locale
    var dateFormat = DateFormat.Hm("en_GB ");
    var time = dateFormat.format(dateTime);

    Color tileColor;
    switch (event.rating) {
      case 1:
        tileColor = MoodTheme.eventCardColors["red"];
        break;
      case 2:
        tileColor = MoodTheme.eventCardColors["purple"];
        break;
      case 3:
        tileColor = MoodTheme.eventCardColors["blue"];
        break;
      case 4:
        tileColor = MoodTheme.eventCardColors["yellow"];
        break;
      case 5:
        tileColor = MoodTheme.eventCardColors["green"];
        break;
    }

    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(BORDER_RADIUS), color: tileColor),
      alignment: Alignment.center,
      key: ValueKey(event.title),
      child: ListTile(
        leading: Text(
          // TODO: transform time into readable format
          time,
          style: Theme.of(context).textTheme.title,
        ),
        title: Text(
          event.title,
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(BORDER_RADIUS),
      ),
      elevation: 2.0,
      child: _makeListTile(context, event),
    );
  }
}
