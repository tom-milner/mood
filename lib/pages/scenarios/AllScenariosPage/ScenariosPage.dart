import 'package:flutter/material.dart';
import 'package:mood_app/pages/scenarios/AllScenariosPage/ScenariosList.dart';
import "package:mood_app/widgets/PageTitle.dart";
import "package:mood_app/widgets/SearchBar.dart";
import "package:mood_app/ui/theme.dart";


class ScenariosPage extends StatefulWidget {
  _ScenariosPageState createState() => _ScenariosPageState();
}


class _ScenariosPageState extends State<ScenariosPage> {
  String dropdownValue = "Hello";

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: new SingleChildScrollView(
//          mainAxisAlignment: MainAxisAlignment.center,

          child: Column(
          children: <Widget>[
//            SizedBox(
//              height: 20,
//            ),

//            new PageTitle("SCENARIOS"),

//            new Container(
//                alignment: Alignment.centerLeft,
//                child: Text(
//                  "Favourites",
//                  style: new TextStyle(
//                      fontFamily: "Muli",
//                      fontWeight: FontWeight.w300,
//                      fontSize: 20),
//                )),

            Row(
              
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SearchBar(),
//              IconButton(
//                icon: Icon(
//                  Icons.arrow_drop_down,
//                  color: MoodThemeData.buttonColor,
//                ),
//                iconSize: 40,
//
//              )
//                DropdownButtonHideUnderline(
//                  child: DropdownButton<String>(
//                    hint: Text("Sort"),
//                    iconSize: 30,
//                    items: <String>['GHello', 'B', 'C', 'D'].map((String value) {
//                      return DropdownMenuItem<String>(
//                          value: value, child: new Text(value));
//                    }).toList(),
//                    onChanged: (_) {},
//                  ),
//                ),
              // TODO: Sort Function
              PopupMenuButton<String>(
                padding: EdgeInsets.all(0),
                tooltip: "Sort",
                child: Icon(Icons.arrow_drop_down, size: 40, color: MoodThemeData.buttonColor,),
                itemBuilder: (BuildContext context){
                  return <PopupMenuEntry<String>>[
                    const PopupMenuItem(child: Text("Mental"), value: "GoodBye",),
                  ];
                },
              )

              ],
            ),
            ScenariosList()
          ]),
    ),);
  }
}
//TODO: Dynamic section rendering e.g. favourites, then new etc.
