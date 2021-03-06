import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:mood_app/pages/journal/JournalPage.dart';
import "package:mood_app/ui/theme.dart";
import "package:mood_app/pages/scenarios/CategoriesPage/CategoriesPage.dart";
import "package:mood_app/pages/home/Dashboard.dart";
import "package:mood_app/pages/main/MoodDrawer.dart";

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<Main> {
  int _currentIndex = 0;
  String appBarTitle = "Mood";

  void changePage(int index, String title) {
    if (!(_currentIndex == index)) {
      setState(() {
        _currentIndex = index;
        appBarTitle = title;
      });
    }
  }

  final List<Widget> _pages = [
    Dashboard(),
    CategoriesPage(),
    JournalPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        title: Text(
          appBarTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline,
        ),
        backgroundColor: Theme.of(context).appBarTheme.color,
      ),
      drawer: MoodDrawer(
          (DynamicTheme.of(context).data == MoodTheme.DarkMoodThemeData)),
      bottomNavigationBar: Container(
        height: 55.0,
        child: new BottomAppBar(
          color: Theme.of(context).canvasColor,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(

                icon: Icon(Icons.home),
                color: Theme.of(context).iconTheme.color,
                onPressed: () {
                  changePage(0, "Mood");
                },
              ),
              IconButton(
                icon: Icon(Icons.library_books),
                color: Theme.of(context).iconTheme.color,
                onPressed: () {
                  changePage(1, "Tips");
                },
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                color: Theme.of(context).iconTheme.color,
                onPressed: () {
                  changePage(2, "Journal");
                },
              )
            ],
          ),
        ),
      ),
      body:  _pages[_currentIndex],
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}
