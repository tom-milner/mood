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
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 6.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: MoodThemeData.primaryColor,
          borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
        ),
        child: _makeListTile(widget.scenario),
      ),
    );
  }

// helper methods
  Widget _makeListTile(scenario) {
    return Container(
      key: ValueKey(scenario.title),
//      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        child: ListTile(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ScenarioPage(scenario: scenario,))),

          title: new Text(
          scenario.title,
          style: new TextStyle(
              color: MoodThemeData.buttonColor,
              fontWeight: FontWeight.w300,
              fontSize: 20.0),
          textAlign: TextAlign.left,
        ),

        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: MoodThemeData.buttonColor,
          size: 40.0,
        ),
      ),
        ),
      );



//        leading: Container(
//          padding: EdgeInsets.only(right: 30.0),
//          margin: EdgeInsets.only(right: 20.0),
//          decoration: new BoxDecoration(
//              border: new Border(
//                  right: new BorderSide(
//                      width: .5, color: MoodThemeData.buttonColor))),
////        child: Icon(scenario.icon, color: MoodThemeData.buttonColor, size: 30.0,),
//        ),
//        title: new Text(
//          scenario.title,
//          style: new TextStyle(
//              color: MoodThemeData.buttonColor,
//              fontWeight: FontWeight.w300,
//              fontSize: 25.0),
//          textAlign: TextAlign.left,
//        ),
//
//        trailing: Icon(
//          Icons.keyboard_arrow_right,
//          color: MoodThemeData.buttonColor,
//          size: 40.0,
//        ),
//      ),
//    );
  }
}
