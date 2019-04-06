import 'package:dynamic_theme/dynamic_theme.dart';
import "package:flutter/material.dart";
import "package:mood_app/ui/theme.dart";
import "package:mood_app/pages/scenarios/ScenarioPage/ScenarioPage.dart";
import "package:mood_app/models/Scenario.dart";

// card content model
//class MoodCardContent {
//  final String title;
//  final IconData icon;
//  MoodCardContent(this.title, this.icon);
//}
//

class ScenarioCard extends StatefulWidget {
  final Scenario scenario;
  ScenarioCard(this.scenario);

//
//  static final MoodCardContent content = MoodCardContent(title, icon);
//

  _ScenarioCardState createState() => _ScenarioCardState();
}

class _ScenarioCardState extends State<ScenarioCard> {



  @override
  Widget build(BuildContext context) {

    print(widget.scenario);



    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
        ),
        child: _makeListTile(widget.scenario),
      ),
    );
  }

// helper methods
  Widget _makeListTile(scenario) {
    return Container(
      alignment: Alignment.center,
      key: ValueKey(scenario.title),
//      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        child: ListTile(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ScenarioPage(scenario: scenario,))),

          title: new Text(
          scenario.title,
          style: Theme.of(context).textTheme.title,
        ),

        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Theme.of(context).iconTheme.color,
          size: 40.0,
        ),
      ),
        ),
      );

  }
}
