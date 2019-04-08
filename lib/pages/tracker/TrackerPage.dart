import 'package:flutter/material.dart';
import 'package:mood_app/pages/tracker/EventList.dart';
import "package:mood_app/widgets/MoodCard.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TrackerPage extends StatefulWidget {
  _trackerPageState createState() => _trackerPageState();
}

class _trackerPageState extends State<TrackerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        child: StaggeredGridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          staggeredTiles: [
            StaggeredTile.count(2, 1.5),
            StaggeredTile.count(2, 1),
          ],
          children: <Widget>[
            MoodCard(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Today",
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ],
                    ),
                    EventList(),
                  ],
                ),
              ),
            ),
            MoodCard(child: Text("£"))
          ],
        ));
  }
}
