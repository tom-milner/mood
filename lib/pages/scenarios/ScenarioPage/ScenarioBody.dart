import "package:flutter/material.dart";
import "package:mood_app/models/Scenario.dart";
import "package:mood_app/ui/theme.dart";

class ScenarioBody extends StatelessWidget{
  final Scenario scenario;

  ScenarioBody(this.scenario);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
       padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          children: <Widget>[
            new Text(
              scenario.content,
              style: TextStyle(
                fontSize:18.0,
                color: MoodThemeData.textSelectionColor
              ),
            )
          ],
        ),
      ),
    );
  }
}
