import 'package:flutter/material.dart';
import "package:mood_app/pages/main/navbar.dart";
import "package:mood_app/ui/theme.dart";
import "package:mood_app/pages/exercises/exercises.dart" ;
import "package:mood_app/pages/scenarios/scenarios.dart";
import "package:mood_app/pages/calendar/calendar.dart";
import "package:mood_app/pages/home/home.dart";

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<Main> {

  int _currentIndex = 0;




  final List<Widget> _pages= [
    HomePage(Colors.blueAccent),
    ScenariosPage(Colors.purpleAccent),
    ExercisesPage(Colors.redAccent),
    CalendarPage(Colors.greenAccent),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(),
      body: _pages[_currentIndex],
      backgroundColor: MoodThemeData.accentColor,
    );
  }

  int getCurrentIndex(){
    return this._currentIndex;
  }

  void setCurrentIndex(int index){
      _currentIndex = index;
      print(_pages[_currentIndex]);

  }
}

// start