import "package:flutter/material.dart";
import "package:mood_app/models/Scenario.dart";
import "package:mood_app/pages/scenarios/ScenarioPage/ScenarioAppBar.dart";
import "package:mood_app/pages/scenarios/ScenarioPage/ScenarioBody.dart";
import "package:mood_app/ui/theme.dart";

class ScenarioPage extends StatelessWidget {
  final Scenario scenario;
  ScenarioPage({Key key, this.scenario}) : super(key: key);


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
