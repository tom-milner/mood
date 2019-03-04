import "package:flutter/material.dart";
import 'package:mood_app/models/Scenario.dart';
import 'package:mood_app/pages/scenarios/MoodCard.dart';
import 'package:mood_app/services/scenarios/ScenarioService.dart';

// class to display scenarios
class PageContent extends StatefulWidget {
  // array containing avalailable scenarios
  List<Scenario> scenarios = new List<Scenario>();

  PageContent(){
    this.scenarios = ScenariosService().getScenarios();
  }

  _PageContentState createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {

  // build individual scenario cards
  Widget _buildScenario(Scenario scenario){
    return new MoodCard(scenario);
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
          shrinkWrap: true,
        itemCount : widget.scenarios.length,
        itemBuilder: (BuildContext context, int index){
          print(widget.scenarios[index].title);
          print(index);
          return _buildScenario(widget.scenarios[index]);
        },
      )
    );
  }
}
