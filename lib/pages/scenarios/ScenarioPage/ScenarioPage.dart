import "package:flutter/material.dart";
import "package:mood_app/models/Scenario.dart";
import "package:mood_app/pages/scenarios/ScenarioPage/ScenarioAppBar.dart";
import "package:mood_app/pages/scenarios/ScenarioPage/ScenarioBody.dart";

class ScenarioPage extends StatelessWidget {
  final Scenario scenario;
  ScenarioPage(scenarios, {Key key, this.scenario}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final appBar = ScenarioAppBar(scenario);
    final body = ScenarioBody(scenario);

    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
