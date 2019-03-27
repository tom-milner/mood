import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mood_app/pages/scenarios/AllScenariosPage/ScenariosList.dart';
import "package:mood_app/widgets/PageTitle.dart";
import "package:mood_app/widgets/SearchBar.dart";

class ScenariosPage extends StatefulWidget {
  _ScenariosPageState createState() => _ScenariosPageState();
  List<dynamic> scenarios;

  void initState() {
    getScenarios();
  }

  Future<dynamic> getScenarios() async {
    Stream<QuerySnapshot> snapshot =
        Firestore.instance.collection("scenarios").snapshots();
    print(snapshot);
//    widget.scenarios = snapshot.data.documents;
  }
}

class _ScenariosPageState extends State<ScenariosPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new PageTitle("SCENARIOS"),
            new SearchBar(),
            new Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Favourites",
                  style: new TextStyle(
                      fontFamily: "Muli",
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                )),
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection("scenarios").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      child: CircularProgressIndicator());
                }
                return ScenariosList();
              },
            ),
          ]),
    );
  }
}
//TODO: Dynamic section rendering e.g. favourites, then new etc.
