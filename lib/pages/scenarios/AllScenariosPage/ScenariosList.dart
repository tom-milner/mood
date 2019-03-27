import "package:flutter/material.dart";
import 'package:mood_app/models/Scenario.dart';
import 'package:mood_app/pages/scenarios/AllScenariosPage/ScenarioCard.dart';
import "package:cloud_firestore/cloud_firestore.dart";

// class to display scenarios
class ScenariosList extends StatefulWidget {
  _ScenariosListState createState() => _ScenariosListState();
}

class _ScenariosListState extends State<ScenariosList> {
  // build individual scenario cards
  Widget _buildScenario(BuildContext context, DocumentSnapshot scenarios) {
    final scenario = Scenario.fromSnapshot(scenarios);

    return new ScenarioCard(scenario);
  }

  Widget _buildScenarioList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: EdgeInsets.all(0),
      // creates a list of hashmapped db data.
      children: snapshot.map((data) => _buildScenario(context, data)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Contains a stream that will update content whenever changes are made to Cloud Firestore database.
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("scenarios").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: CircularProgressIndicator(),

            );
          }
          return Expanded(
              child: _buildScenarioList(context, snapshot.data.documents));

        }
//            return SizedBox(
//                height:3,
//                width:30,
//                child: CircularProgressIndicator());
//          }
        );
  }
}
