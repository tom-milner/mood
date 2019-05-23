import "package:flutter/material.dart";

class FavouriteScenariosPage extends StatefulWidget {
  @override
  _favouriteScenariosPageState createState() => _favouriteScenariosPageState();
}

class _favouriteScenariosPageState extends State<FavouriteScenariosPage> {
  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Theme.of(context).canvasColor,
//      appBar: AppBar(
//        elevation: 0,
//        backgroundColor: Theme.of(context).canvasColor,
//        title: Text(
//          category.title,
//          textAlign: TextAlign.center,
//          style: Theme.of(context).textTheme.title.copyWith(
//            fontWeight: FontWeight.w300,
//            fontSize: 30,
////                color: Theme.of(context).primaryColor,
//          ),
//        ),
////        textTheme: Theme.of(context).textTheme,
//      ),
//      body: StreamBuilder(
//          stream: scenarioBloc.filteredScenarios,
//          builder: (BuildContext context, AsyncSnapshot snapshot) {
//            if (!snapshot.hasData) {
//              return Container(
//                alignment: Alignment.center,
//                child: CircularProgressIndicator(),
//              );
//            }
//
//
//            if (snapshot.data.length <= 0) {
//              return Container(
//                  alignment: Alignment.center,
//                  child: Text("No Scenarios for this category!",
//                      textAlign: TextAlign.center,
//                      style: Theme.of(context)
//                          .textTheme
//                          .headline
//                          .copyWith(color: Colors.grey)));
//            }
//
//            return ListView.builder(
//              padding: EdgeInsets.symmetric(horizontal: 10),
//              shrinkWrap: true,
//              itemCount: snapshot.data.length,
//              itemBuilder: (BuildContext context, int index) {
//                Scenario scen = snapshot.data[index];
//                return ScenarioCard(scen);
//              },
//            );
//          }),
//    );
  }
}
