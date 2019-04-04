import "package:flutter/material.dart";
import 'package:mood_app/models/Scenario.dart';
import 'package:mood_app/pages/scenarios/AllScenariosPage/ScenarioCard.dart';
import "package:mood_app/blocs/ScenarioBloc.dart";

// class to display scenarios
class ScenariosList extends StatefulWidget {
  _ScenariosListState createState() => _ScenariosListState();
}

class _ScenariosListState extends State<ScenariosList> {

  final scenarioBloc = ScenarioBloc();




  // build individual scenario cards
  Widget _buildScenarioListItem(Scenario scen) {
//        new Scenario(scenario["title"], scenario["content"], scenario["icon"]);
    return new ScenarioCard(scen);
  }

  Widget _buildScenarioList(BuildContext context) {
    return StreamBuilder(
        stream: scenarioBloc.scenarios,
        builder:
            (BuildContext context, AsyncSnapshot<List<Scenario>> snapshot) {

          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return ListView.builder(

            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
//      padding: EdgeInsets.all(0),
            itemExtent: 90.0,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Scenario scen = snapshot.data[index];
              return _buildScenarioListItem(scen);
            },
//      itemBuilder: snapshot.map((data) => _buildScenario(context, data)).toList(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return _buildScenarioList(context);
  }
}
