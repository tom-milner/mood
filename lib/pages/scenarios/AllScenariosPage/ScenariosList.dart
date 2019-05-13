import "package:flutter/material.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mood_app/models/Scenario.dart';
import 'package:mood_app/pages/scenarios/AllScenariosPage/ScenarioCard.dart';
import "package:mood_app/blocs/ScenarioBloc.dart";

// class to display scenarios
class ScenariosList extends StatefulWidget {
  _ScenariosListState createState() => _ScenariosListState();
}

class _ScenariosListState extends State<ScenariosList> {
  final scenarioBloc = ScenarioBloc();

  Widget _buildScenarioList(BuildContext context) {
          return StreamBuilder(
              stream: scenarioBloc.scenarios,
              builder: (BuildContext context, AsyncSnapshot scenariosSnapshot) {
                print("building");
                if (!scenariosSnapshot.hasData) {
                  return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  );
                }
                print("Scenarios Snapshot: ${scenariosSnapshot.toString()}");

                // GRID IMPLEMENTATION
                return StaggeredGridView.countBuilder(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 8,
                  shrinkWrap: true,
                  itemCount: scenariosSnapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Scenario scenario = scenariosSnapshot.data[index];
                    return ScenarioCard(scenario);
                  },
                  staggeredTileBuilder: (int index) {
                    return StaggeredTile.count(4, 3);
                  },
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                );
              });
  }

  @override
  Widget build(BuildContext context) {
    return _buildScenarioList(context);
  }

  @override
  void dispose() {
    scenarioBloc.dispose();
    super.dispose();
  }
}
