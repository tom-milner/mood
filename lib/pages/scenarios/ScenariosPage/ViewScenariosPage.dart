import "package:flutter/material.dart";
import 'package:mood_app/models/Scenario.dart';
import "package:mood_app/services/ScenarioService.dart";
import 'package:mood_app/widgets/MoodCard.dart';

class ViewScenariosPage extends StatelessWidget {
  final List<Scenario> scenarios;

  ViewScenariosPage({this.scenarios});

  @override
  Widget build(BuildContext context) {
    Widget buildScenarioCard(Scenario scenario) {
      return MoodCard(
        child: Text(scenario.title),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Scenarios"),
      ),
      body: ListView.builder(
        itemCount: scenarios.length,
        itemBuilder: (BuildContext context, int index) {
          Scenario scen = scenarios[index];
          return buildScenarioCard(scen);
        },
      ),
    );
  }
}
