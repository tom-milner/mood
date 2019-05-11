import 'package:flutter/material.dart';
import 'package:mood_app/blocs/EventsBloc.dart';
import 'package:mood_app/models/Event.dart';
import 'package:mood_app/pages/tracker/EventCard.dart';
import 'package:mood_app/pages/tracker/EventList.dart';
import 'package:mood_app/pages/tracker/NewEventPage/NewEventPage.dart';
import "package:mood_app/widgets/MoodCard.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TrackerPage extends StatefulWidget {
  _trackerPageState createState() => _trackerPageState();
}

class _trackerPageState extends State<TrackerPage> {
  final eventBloc = EventBloc();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        eventBloc.getAllEvents();
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
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
              },
              // TODO: implement seperated List of events (calendar)
            )
          ],
        ),
      ),
    );
  }
}
