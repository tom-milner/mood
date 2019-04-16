import "package:flutter/material.dart";
import 'package:mood_app/widgets/PageTitle.dart';

class EventsPage extends StatefulWidget {
  _eventsPageState createState() => _eventsPageState();
}

class _eventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Container(
        padding: EdgeInsets.only(top:100),
        child: FloatingActionButton(
          mini: true,
          onPressed: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back),
        ),
//      appBar: AppBar(
//        elevation: 0,
//        iconTheme: Theme.of(context).appBarTheme.iconTheme,
//        backgroundColor: Theme.of(context).appBarTheme.color,
//        leading:
//      ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
//          padding: EdgeInsets.all(20),
          child: PageTitle("Today")),
    );
  }
}
