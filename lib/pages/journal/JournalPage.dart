import 'package:flutter/material.dart';
import 'package:mood_app/blocs/EventBloc.dart';
import 'package:mood_app/models/Event/Event.dart';
import 'package:mood_app/pages/journal/EventCard.dart';
import 'package:mood_app/pages/journal/NewEventPage/NewEventPage.dart';
import "package:mood_app/widgets/MoodCard.dart";

class JournalPage extends StatefulWidget {
  _journalPageState createState() => _journalPageState();
}

class _journalPageState extends State<JournalPage> {
  final eventBloc = EventBloc();

  @override
  void dispose() {
    eventBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        eventBloc.getAllEvents();
      },
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => NewEventPage()));
            },
            child: MoodCard(
              color: Theme.of(context).primaryColor,
              child: Container(
                  padding: EdgeInsets.all(15),
                  height: 80,
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.brush,
                        color: Theme.of(context).canvasColor,
                        size: 35,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 35),
                        child: Text(
                          "Add a new entry",
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Theme.of(context).canvasColor),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          StreamBuilder(
            stream: eventBloc.events,
            builder: (BuildContext context, AsyncSnapshot eventSnapshot) {
              if (!eventSnapshot.hasData) {
                return Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                );
              }

              if (eventSnapshot.data.length <= 0) {
                return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 200),
                    child: Text("No Entries!",
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .copyWith(color: Colors.grey)));
              } else {
                return ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    itemCount: eventSnapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Event event = eventSnapshot.data[index];
                      return EventCard(event);
                    });
              }
            },
            // TODO: implement seperated List of events (calendar)
          )
        ],
      ),
    );
  }
}
