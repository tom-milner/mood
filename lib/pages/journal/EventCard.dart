import "package:flutter/material.dart";
import 'package:mood_app/models/Event/Event.dart';
import 'package:mood_app/pages/journal/ViewEventPage/ViewEventPage.dart';
import "package:mood_app/ui/theme.dart";
import 'package:mood_app/utils/Utils.dart';
import 'package:mood_app/widgets/MoodCard.dart';

class EventCard extends StatelessWidget {
  final Event event;
  Color tileColor;
  IconData tileIcon;
  EventCard(this.event);

  _makeEventCard(BuildContext context, Event event) {
    switch (event.rating) {
      case 1:
        tileColor = MoodTheme.eventCardColors["red"];
        tileIcon = Icons.sentiment_very_dissatisfied;
        break;
      case 2:
        tileColor = MoodTheme.eventCardColors["purple"];
        tileIcon = Icons.sentiment_dissatisfied;
        break;
      case 3:
        tileColor = MoodTheme.eventCardColors["blue"];
        tileIcon = Icons.sentiment_neutral;
        break;
      case 4:
        tileColor = MoodTheme.eventCardColors["yellow"];
        tileIcon = Icons.sentiment_satisfied;

        break;
      case 5:
        tileColor = MoodTheme.eventCardColors["green"];
        tileIcon = Icons.sentiment_very_satisfied;

        break;
    }
    Color darkColor = Utils.darkenColor(tileColor);

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    ViewEventPage(event, tileColor, tileIcon)));
      },
      child: MoodCard(
        child: Container(
            height: 350,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(

//              border: Border(
//                top: BorderSide(color: tileColor, width: 10)
//              ),

                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [.7, 1],
                    colors: [darkColor, Utils.darkenColor(darkColor)])),
            key: ValueKey(event.title),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      tileIcon,
                      size: 60,
                      color: tileColor,
                    ),
                    Container(
                      width: 40,
                      child: Text(
                        event.getShortDateTime(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.display1.copyWith(
                              color: tileColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
                Container(
                    width: 700,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      event.title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline.copyWith(
                          color: tileColor,
                          fontSize: 60,
                          fontWeight: FontWeight.w100),
                    ))
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _makeEventCard(context, event);
  }
}
