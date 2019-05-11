import "package:flutter/material.dart";
import 'package:mood_app/models/Event.dart';
import 'package:mood_app/widgets/MoodCard.dart';
import 'package:mood_app/widgets/PageTitle.dart';

class ViewEventPage extends StatelessWidget {
  Event event;
  Color eventColor;
  IconData eventIcon;

  ViewEventPage(this.event, this.eventColor, this.eventIcon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Container(
              child: Text(
            event.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline.copyWith(
                fontSize: 45,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                color: eventColor,
                decoration: TextDecoration.underline),
          )),

          // Notes Section
          MoodCard(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                Text(
                  "Notes:",
                  style: Theme.of(context).textTheme.title,
                ),
                Text(event.notes),
              ],
            ),
          )
        ],
      ),
    );
  }
}
