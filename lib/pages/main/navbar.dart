import "package:flutter/material.dart";
import "package:mood_app/ui/theme.dart";
import "package:mood_app/pages/main/main.dart" as main;

class NavBar extends StatelessWidget {

  int _currentIndex = main.MainState().getCurrentIndex();

  changePage(int index ){
    if(!(_currentIndex == index)){
      main.MainState().setCurrentIndex(index);
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Container(
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
    );
  }
}
