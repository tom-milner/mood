import 'package:flutter/material.dart';
import "package:mood_app/widgets/PageTitle.dart";
import "package:mood_app/widgets/MoodCard.dart";

class ScenariosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10.0),
        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new PageTitle("SCENARIOS"),
              new SizedBox(height: 50.0,),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              new MoodCard("School", Icons.note),
              new MoodCard("Relationships", Icons.favorite_border),
              new MoodCard("Family", Icons.group)],)
            ],
        ),
    );
  }
}