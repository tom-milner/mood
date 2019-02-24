import "package:flutter/material.dart";
import "package:mood_app/pages/home/DashboardItem.dart";
import 'package:mood_app/widgets/PageTitle.dart';
import 'package:mood_app/ui/theme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<StaggeredTile> _staggeredTiles =  <StaggeredTile>[
     StaggeredTile.count(4, 1),
     StaggeredTile.count(4, 2),
     StaggeredTile.count(4, 2),
     StaggeredTile.count(2, 2),
     StaggeredTile.count(1, 1),
     StaggeredTile.count(1, 1),
     StaggeredTile.count(2, 1),
  ];

  List<Widget> _tiles =  <Widget>[
     PageTitle("MOOD"),
     buildItemTitle("Overall"),
     buildItemTitle("This Week"),
     buildItemTitle("Next Event"),
     buildIconButton(Icons.accessibility_new, "test"),
     buildIconButton(Icons.calendar_today, "test"),
     buildIconButton(Icons.library_books, "test"),

  ];



  static Widget buildIconButton(IconData icon, String route){
    return new DashboardItem(  IconButton(
      icon: Icon(icon),
      disabledColor: MoodThemeData.buttonColor,
      color: MoodThemeData.buttonColor,
      onPressed: (){
        // TODO button navigation in dashboard
      },
      iconSize: 32.0,
    ),);
  }

  static Widget  buildItemTitle(String text){
    return new DashboardItem( Container (
      padding: EdgeInsets.only(top: 10, left: 10),
      child: new Text(
        text,
        style: new TextStyle(
            color: MoodThemeData.buttonColor,
            fontWeight: FontWeight.w300,
            fontSize: 20.0),
        textAlign: TextAlign.left,
      ),),);
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
//        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: new StaggeredGridView.count(
          crossAxisCount: 4,

          staggeredTiles: _staggeredTiles,
          children: _tiles,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          padding: const EdgeInsets.all(4.0),
        ));
  }
}
