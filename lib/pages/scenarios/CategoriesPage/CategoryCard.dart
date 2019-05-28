import 'dart:math';

import "package:flutter/material.dart";
import "package:mood_app/models/Category.dart";
import 'package:mood_app/pages/scenarios/ScenariosPage/ViewScenariosPage.dart';
import 'package:mood_app/services/ScenarioService/ScenarioService.dart';
import 'package:mood_app/utils/Utils.dart';
import "package:mood_app/widgets/MoodCard.dart";

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

class CategoryCard extends StatelessWidget {
  final Category category;
  CategoryCard(this.category);

  final Color tileColor = DummyData().getRandomColor();

  ScenarioService scenarioService = new ScenarioService();

  getScenarios() async {
    return await scenarioService.getScenariosOfCategory(category);
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        return Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
              return ViewScenariosPage(category: category);
        }));
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
                category.title,
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
