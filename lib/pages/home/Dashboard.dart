import "package:flutter/material.dart";
import "package:mood_app/pages/home/DashboardItem.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
  ];

  List<DashboardItem> _tiles = const <DashboardItem>[
    const DashboardItem(Icons.calendar_today, "Hello"),
    const DashboardItem(Icons.accessibility_new, "Exercises"),
    const DashboardItem(Icons.library_books, "Scenarios"),
    const DashboardItem(Icons.ac_unit, "yeet"),
    const DashboardItem(Icons.calendar_today, "Hello"),
    const DashboardItem(Icons.accessibility_new, "Exercises"),
    const DashboardItem(Icons.library_books, "Scenarios"),
    const DashboardItem(Icons.ac_unit, "yeet"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: new StaggeredGridView.count(
          crossAxisCount: 2,

          staggeredTiles: _staggeredTiles,
          children: _tiles,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          padding: const EdgeInsets.all(4.0),
        ));
  }
}
