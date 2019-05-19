import "package:flutter/material.dart";
import 'package:mood_app/blocs/ScenarioBloc.dart';
import 'package:mood_app/models/Category.dart';
import 'package:mood_app/models/Scenario.dart';
import 'package:mood_app/pages/scenarios/ScenariosPage/ScenarioCard.dart';
import 'package:mood_app/widgets/MoodCard.dart';

class ViewScenariosPage extends StatelessWidget {
//  final List<Scenario> scenarios;
  final Category category;
  ViewScenariosPage(this.category);

  @override
  Widget build(BuildContext context) {
    var scenarioBloc = ScenarioBloc();
    scenarioBloc.getScenariosOfCategory(category);

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          category.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.title.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 30,
//                color: Theme.of(context).primaryColor,
              ),
        ),
//        textTheme: Theme.of(context).textTheme,
      ),
      body: StreamBuilder(
          stream: scenarioBloc.filteredScenarios,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data.length <= 0) {
              return Container(
                  alignment: Alignment.center,
                  child: Text("No Scenarios for this category!",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .copyWith(color: Colors.grey)));
            }

            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Scenario scen = snapshot.data[index];
                return ScenarioCard(scen);
              },
            );
          }),
    );
  }
}
