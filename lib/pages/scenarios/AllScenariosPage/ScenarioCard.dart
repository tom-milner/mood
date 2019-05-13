import 'dart:math';

import "package:flutter/material.dart";
import "package:mood_app/models/Scenario.dart";
import 'package:mood_app/utils/Utils.dart';
import "package:mood_app/widgets/MoodCard.dart";
import "package:mood_app/pages/scenarios/ScenarioCategoryPage/ViewScenarioCategoryPage.dart";

// DUMMY DATA FOR TESTING

class DummyData {
  static final dummyColors = [
    Colors.red[300],
    Colors.blue[300],
    Colors.green[300],
    Colors.purple[300]
  ];

  var random = new Random();

  getRandomColor() {
    return dummyColors[random.nextInt(4)];
  }
}

class ScenarioCard extends StatelessWidget {
  final Scenario scenario;
  ScenarioCard(this.scenario);

  final Color tileColor = DummyData().getRandomColor();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=>{
        Navigator.of(context).push(
            MaterialPageRoute(
            builder: (BuildContext context)=>
              ViewScenariosCategoryPage()
            ))
      },
      child: Container(
        child: MoodCard(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [tileColor, Utils.darkenColor(tileColor)])),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            alignment: Alignment.bottomLeft,
            child: FittedBox(
              child: Text(
                scenario.title,
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
