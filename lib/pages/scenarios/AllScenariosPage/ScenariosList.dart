import "package:flutter/material.dart";
import 'package:mood_app/models/Scenario.dart';
import 'package:mood_app/pages/scenarios/AllScenariosPage/ScenarioCard.dart';

// class to display scenarios
class ScenariosList extends StatefulWidget {

  var scenarios;
  ScenariosList(this.scenarios);

  _ScenariosListState createState() => _ScenariosListState();
}

class _ScenariosListState extends State<ScenariosList> {
  // build individual scenario cards
  Widget _buildScenarioListItem(BuildContext context, scenario) {
//    Scenario scenario = Scenario.fromSnapshot(scenarios);
  Scenario newScenario = new Scenario(scenario["title"], scenario["content"], scenario["icon"]);
    return new ScenarioCard(newScenario);
  }

  Widget _buildScenarioList(
      BuildContext context, List<dynamic> snapshot) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
//      padding: EdgeInsets.all(0),
    itemExtent: 80.0,
      itemCount: widget.scenarios.length,
      itemBuilder: (context, index){
        print(widget.scenarios.length);
        return _buildScenarioListItem(context, widget.scenarios[index]);
      },
//      itemBuilder: snapshot.map((data) => _buildScenario(context, data)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
     return _buildScenarioList(context, widget.scenarios);
  }
}
