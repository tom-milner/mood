import 'package:flutter/material.dart';
import 'package:mood_app/pages/scenarios/AllScenariosPage/PageContent.dart';
import "package:mood_app/widgets/PageTitle.dart";

class ScenariosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new PageTitle("SCENARIOS"),
            new SizedBox(
              height: 20.0,
            ),
            new Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Favourites",
                  style: new TextStyle(
                    fontFamily: "Muli",
                    fontWeight: FontWeight.w300,
                    fontSize: 20
                  ),
                )),
             PageContent(),
          ]),
    );
  }
}
//TODO: Dynamic section rendering e.g. favourites, then new etc.