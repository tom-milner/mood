import "package:flutter/material.dart";
import 'package:mood_app/blocs/EventsBloc.dart';
import 'package:mood_app/models/Event.dart';
import 'package:mood_app/pages/tracker/EventCard.dart';
import 'package:mood_app/pages/tracker/NewEventPage/NewEventPage.dart';

class EventsPage extends StatefulWidget {
  _eventsPageState createState() => _eventsPageState();
}

class _eventsPageState extends State<EventsPage> {
  final eventBloc = EventBloc();

  @override
  Widget build(BuildContext context) {
    // TODO: Implement add event button and page

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      // add new event button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // open new Event page
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => NewEventPage()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Upcoming Events"),
        textTheme: Theme.of(context).textTheme,
        elevation: 0,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        backgroundColor: Theme.of(context).appBarTheme.color,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: StreamBuilder(
        stream: eventBloc.events,
        builder: (BuildContext context, AsyncSnapshot eventSnapshot) {
          if (!eventSnapshot.hasData) {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
          );
          }

          return ListView.builder(
              itemCount: eventSnapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Event event = eventSnapshot.data[index];
                return EventCard(event);
              });
        },
        // TODO: implement seperated List of events (calendar)
      ),
    );
  }
}
