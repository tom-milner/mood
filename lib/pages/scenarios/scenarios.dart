import 'package:flutter/material.dart';
import 'package:mood_app/pages/scenarios/PageContent.dart';
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
//              height: 50.0,
            ),
             new PageContent(),
          ]),
    );
  }
}
