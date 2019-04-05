import 'package:flutter/material.dart';
import "package:mood_app/ui/theme.dart";
import "package:mood_app/pages/exercises/exercises.dart";
import "package:mood_app/pages/scenarios/AllScenariosPage/ScenariosPage.dart";
import "package:mood_app/pages/calendar/calendar.dart";
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
    ScenariosPage(),
    ExercisesPage(),
    CalendarPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appBarTitle,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
        ),
        backgroundColor: MoodThemeData.buttonColor,
      ),
      drawer: MoodDrawer(),
      bottomNavigationBar: Container(
        height: 55.0,
        child: new BottomAppBar(
          color: MoodThemeData.canvasColor,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                ),
                color: MoodThemeData.buttonColor,
                disabledColor: Colors.white,
                onPressed: () {
                  changePage(0, "Mood");
                },
              ),
              IconButton(
                icon: Icon(Icons.library_books),
                color: MoodThemeData.buttonColor,
                disabledColor: Colors.white,
                onPressed: () {
                  changePage(1, "Scenarios");
                },
              ),
              IconButton(
                icon: Icon(Icons.accessibility_new),
                color: MoodThemeData.buttonColor,
                disabledColor: Colors.white,
                onPressed: () {
                  changePage(2, "Exercises");
                },
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                color: MoodThemeData.buttonColor,
                disabledColor: Colors.white,
                onPressed: () {
                  changePage(3, "Calendar");
                },
              )
            ],
          ),
        ),
      ),
      body: _pages[_currentIndex],
      backgroundColor: MoodThemeData.canvasColor,
    );
  }
}
