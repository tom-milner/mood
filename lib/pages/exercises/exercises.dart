import 'package:flutter/material.dart';
import "package:mood_app/widgets/PageTitle.dart";
class ExercisesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new PageTitle("Exercises")
        ],
      ),
    );
  }
}