import 'package:async/async.dart';
import "package:flutter/material.dart";
import 'package:mood_app/blocs/FilterScenariosBloc.dart';
import 'package:mood_app/models/Scenario.dart';
import 'package:mood_app/pages/scenarios/AllScenariosPage/ScenarioCard.dart';
import "package:mood_app/blocs/ScenarioBloc.dart";

// class to display scenarios
class ScenariosList extends StatefulWidget {
  _ScenariosListState createState() => _ScenariosListState();
}

class _ScenariosListState extends State<ScenariosList> {
  final scenarioBloc = ScenarioBloc();
  final filterScenariosBloc = FilterScenariosBloc();

  // build individual scenario cards
  Widget _buildScenarioListItem(Scenario scen, String filter) {
    if (!(filter == null || filter == "")) {
      print("null filter");
      if (!(scen.title.contains(filter))) {
        print("match!");
        return ScenarioCard(scen);
      }
    }
    return Container();
  }

  Widget _buildScenarioList(BuildContext context) {
    return StreamBuilder(
        stream: filterScenariosBloc.filterQuery,
        builder: (BuildContext context,
            AsyncSnapshot filterSnapshot) {
          return StreamBuilder(
              stream: scenarioBloc.scenarios,
              builder: (BuildContext context, AsyncSnapshot scenariosSnapshot) {
                print("building");
                if (!scenariosSnapshot.hasData) return CircularProgressIndicator();

                print("Scenarios Snapshot: ${scenariosSnapshot.toString()}");
                print("Filter Snapshot: ${filterSnapshot.toString()}");

                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  itemCount: scenariosSnapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Scenario scen = scenariosSnapshot.data[index];
                    print("Scenario in streambuilder: ${scen.title}");
                    print("Filter Snapshot Data: ${filterSnapshot.data}");
                    return _buildScenarioListItem(scen, filterSnapshot.data);
                  },
                );
              });
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
