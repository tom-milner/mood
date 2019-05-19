import "package:flutter/material.dart";
import 'package:mood_app/models/Scenario.dart';
import 'package:mood_app/pages/scenarios/ScenarioPage/ScenarioPage.dart';
import 'package:mood_app/utils/Utils.dart';
import 'package:mood_app/widgets/MoodCard.dart';

class ScenarioCard extends StatelessWidget {
  Scenario scenario;

  ScenarioCard(this.scenario);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: (){
        return Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context){
            return ScenarioPage(scenario);
          })
        );
      },

      child: Container(
        height: 250,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: MoodCard(
          child: Container(
            color: Theme.of(context).buttonColor,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    scenario.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    scenario.description,
                    style: Theme.of(context).textTheme.title,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
