import 'package:flutter/material.dart';
import 'package:mood_app/pages/scenarios/AllScenariosPage/ScenariosList.dart';
import "package:mood_app/widgets/SearchBar.dart";

class ScenariosPage extends StatefulWidget {
  _ScenariosPageState createState() => _ScenariosPageState();
}

class _ScenariosPageState extends State<ScenariosPage> {
  String dropdownValue = "Hello";
  String filterTerm = "";

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: new SingleChildScrollView(
//          mainAxisAlignment: MainAxisAlignment.center,

        child: Column(children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SearchBar(),
              PopupMenuButton<String>(
                padding: EdgeInsets.all(0),
                tooltip: "Sort",
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 40,
                  color: Theme.of(context).primaryColor,
                ),
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    const PopupMenuItem(
                      child: Text("Mental"),
                      value: "GoodBye",
                    ),
                  ];
                },
              )
            ],
          ),
          ScenariosList()
        ]),
      ),
    );
  }
}
//TODO: Dynamic section rendering e.g. favourites, then new etc.
