import "package:flutter/material.dart";
import 'package:mood_app/widgets/MoodCard.dart';

class NewEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleInput = MoodCard(
      child: Container(
        height: 70,
        alignment: Alignment.center,
        child: TextField(
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: Theme.of(context).primaryColor),
          decoration: InputDecoration(
            hintText: "Event Title",
            prefixIcon: Icon(
              Icons.title,
              color: Theme.of(context).primaryColor,
            ),
            border: InputBorder.none,
            focusedBorder: null,
            enabledBorder: null,
//                    contentPadding: EdgeInsets.symmetric(vertical: 5)),
          ),
        ),
      ),
    );
// TODO: make these private
    final notesInput = MoodCard(
      child: Container(
        height: 200,
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: 9,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Notes"
          ),
        ),

      ),
    );

    return Scaffold(
      appBar: new AppBar(
        title: Text("Add New Event"),
        textTheme: Theme.of(context).textTheme,
        elevation: 0,
      ),
      body: new Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            titleInput,
            notesInput
          ],
        ),
      ),
    );
  }
}
