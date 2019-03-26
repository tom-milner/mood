import "package:flutter/material.dart";
import 'package:mood_app/models/Scenario.dart';
import 'package:mood_app/pages/scenarios/ScenarioCard.dart';
import 'package:mood_app/services/scenarios/ScenarioService.dart';
import "package:cloud_firestore/cloud_firestore.dart";

// class to display scenarios
class PageContent extends StatefulWidget {
  // array containing avalailable scenarios
//  List<Scenario> scenarios = new List<Scenario>();

//  PageContent(){
//    this.scenarios = ScenariosService().getScenarios();
//  }

  _PageContentState createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  // build individual scenario cards
  Widget _buildScenario(BuildContext context, DocumentSnapshot scenarios) {
    final scenario = Scenario.fromSnapshot(scenarios);
    print(scenario);

    return new ScenarioCard(scenario);
  }

  Widget _buildScenarioList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return new Expanded(
        child: ListView(
      shrinkWrap: true,
      children: snapshot.map((data) => _buildScenario(context, data)).toList(),
    ));
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("scenarios").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return _buildScenarioList(context, snapshot.data.documents);
          }
    );
  }
}

//     return new Expanded(
//      child: StreamBuilder<QuerySnapshot>(
//        scrollDirection: Axis.vertical,
//          shrinkWrap: true,
//        itemCount : widget.scenarios.length,
//        itemBuilder: (BuildContext context, int index){
//          print(widget.scenarios[index].title);
//          print(index);
//          return _buildScenario(widget.scenarios[index]);
//        },
//      )
//    );
