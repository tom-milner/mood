import "package:flutter/material.dart";
import "package:mood_app/models/Scenario.dart";
import "package:mood_app/ui/theme.dart";

class ScenarioAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Scenario scenario;

  ScenarioAppBar(this.scenario);

  @override
  Widget build(BuildContext context) {
    return new  AppBar(
        centerTitle: true,
        title: new Text(
          scenario.title,
          style: new TextStyle(
            color: MoodThemeData.buttonColor,
            fontSize: 35.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        elevation: 0,
        backgroundColor: MoodThemeData.primaryColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
