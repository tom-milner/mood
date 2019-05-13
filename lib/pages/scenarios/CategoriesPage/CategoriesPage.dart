import 'package:flutter/material.dart';
import 'package:mood_app/pages/scenarios/CategoriesPage/CategoriesList.dart';
import "package:mood_app/widgets/SearchBar.dart";

class CategoriesPage extends StatefulWidget {
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  String dropdownValue = "Hello";
  String filterTerm = "";

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text(
                "What can we help with?",
                style: Theme.of(context).textTheme.title.copyWith(
                  fontWeight: FontWeight.w300,
                      fontSize: 30
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CategoriesList(),
            ),
          ]),
    );
  }
}
//TODO: Dynamic section rendering e.g. favourites, then new etc.
