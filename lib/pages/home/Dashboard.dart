import "package:flutter/material.dart";
import "package:mood_app/widgets/MoodCard.dart";
import 'package:mood_app/widgets/PageTitle.dart';
import 'package:mood_app/ui/theme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
//    StaggeredTile.count(4, 1),
    StaggeredTile.count(4, 2),
    StaggeredTile.count(4, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(2, 1),
  ];

  List<Widget> _buildTiles() {
    return <Widget>[
//    PageTitle("MOOD"),
      buildItemTitle("Overall"),
      buildItemTitle("This Week"),
      buildItemTitle("Next Event"),
      buildIconButton(Icons.accessibility_new, "test"),
      buildIconButton(Icons.calendar_today, "test"),
      buildIconButton(Icons.library_books, "test"),
    ];
  }

  Widget buildIconButton(IconData icon, String route) {
    return new MoodCard(
      child: IconButton(
        icon: Icon(icon),
        disabledColor: Theme.of(context).iconTheme.color,
        color: Theme.of(context).iconTheme.color,
        onPressed: () {
          // TODO button navigation in dashboard
        },
        iconSize: 32.0,
      ),
    );
  }

  Widget buildItemTitle(String text) {
    return new MoodCard(
      child: Container(
        padding: EdgeInsets.all(10),
        child: new Text(
          text,
          style: Theme.of(context).textTheme.display1,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
//        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: new StaggeredGridView.count(
      crossAxisCount: 4,
      staggeredTiles: _staggeredTiles,
      children: _buildTiles(),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      padding: const EdgeInsets.all(4.0),
    ));
  }
}
