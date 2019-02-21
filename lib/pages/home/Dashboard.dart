import "package:flutter/material.dart";
import "package:mood_app/pages/home/DashboardItem.dart";
import 'package:mood_app/widgets/PageTitle.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(4, 1),
    const StaggeredTile.count(4, 2),
    const StaggeredTile.count(4, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(2, 1),
  ];

  List<Widget> _tiles = const <Widget>[
    const PageTitle("MOOD"),
    const DashboardItem( "Overall"),
    const DashboardItem("Past Week"),
    const DashboardItem("Next Event"),
    const DashboardItem(null,Icons.accessibility_new),
    const DashboardItem(null,Icons.library_books),
    const DashboardItem(null,Icons.calendar_today),

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
//        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: new StaggeredGridView.count(
          crossAxisCount: 4,

          staggeredTiles: _staggeredTiles,
          children: _tiles,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          padding: const EdgeInsets.all(4.0),
        ));
  }
}
