import "package:flutter/material.dart";
import "package:mood_app/ui/theme.dart";
import "package:mood_app/pages/scenarios/ScenarioPage.dart";
import "package:mood_app/models/Scenario.dart";


// card content model
//class MoodCardContent {
//  final String title;
//  final IconData icon;
//  MoodCardContent(this.title, this.icon);
//}
//

class MoodCard extends StatefulWidget {

  final Scenario scenario;
  MoodCard(this.scenario);

//
//  static final MoodCardContent content = MoodCardContent(title, icon);
//

  _MoodCardState createState() => _MoodCardState();

}


class _MoodCardState extends State<MoodCard>{



  @override
  Widget build(BuildContext context) {

      return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 6.0),
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
    return new ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ScenarioPage(scenario: scenario,)));
      },

      leading: Container(
        padding: EdgeInsets.only(right: 30.0),
        margin: EdgeInsets.only(right: 20.0),
        decoration: new BoxDecoration(

            border: new Border(
                right: new BorderSide(width: .5, color: MoodThemeData.buttonColor))),
        child: Icon(scenario.icon, color: MoodThemeData.buttonColor, size: 30.0,),
      ),
      title: new Text(
        scenario.title,
        style: new TextStyle(
            color: MoodThemeData.buttonColor,
            fontWeight: FontWeight.w300,
            fontSize: 25.0),
        textAlign: TextAlign.left,
      ),

      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: MoodThemeData.buttonColor,
        size: 40.0,
      ),
    );
  }

}