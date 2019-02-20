import 'package:flutter/material.dart';
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



  void changePage(int index ){
    if(!(_currentIndex == index)){
      setState(() {
        _currentIndex = index;
      });
    }
  }

  final List<Widget> _pages= [
    HomePage(Colors.blueAccent),
    ScenariosPage(Colors.purpleAccent),
    ExercisesPage(Colors.redAccent),
    CalendarPage(Colors.greenAccent),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 55.0,
        child: new BottomAppBar(
          color: MoodThemeData.accentColor,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home,),
//              color: Colors.white70,
                disabledColor: Colors.white,
                onPressed: (){changePage(0);},
              ),
              IconButton(
                icon: Icon(Icons.library_books),
//              color: Colors.white70,
                disabledColor: Colors.white,
                onPressed: (){changePage(1);},

              ),
              IconButton(
                icon: Icon(Icons.accessibility_new),
//              color: Colors.white70,
                disabledColor: Colors.white,
                onPressed: (){changePage(2);},

              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
//              color: Colors.white70,
                disabledColor: Colors.white,
                onPressed: (){changePage(3);},

              )
            ],
          ),
        ),
      ),
      body: _pages[_currentIndex],
      backgroundColor: MoodThemeData.accentColor,
    );
  }

}
