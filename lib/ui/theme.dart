import "package:flutter/material.dart";

class MoodTheme {
  static final ThemeData LightMoodThemeData = ThemeData(
    // default brightness and colours
    buttonColor: Color.fromRGBO(245, 245, 245, 1),
//  primaryColor: Colors.blue,
//  accentColor: Color.fromRGBO(58, 66, 86, 1.0),
    canvasColor: Color.fromRGBO(239, 239, 239, 1.0),
    primaryColor: Color.fromRGBO(84, 152, 245, 1.0),
    textSelectionColor: Color.fromRGBO(100, 100, 100, 1.0),
//      brightness: Brightness.dark,
    // Icon Themes
    iconTheme: IconThemeData(
      color: Color.fromRGBO(84, 152, 245, 1.0),
    ),
    appBarTheme: AppBarTheme(
        color: Color.fromRGBO(84, 152, 245, 1.0),
        iconTheme: IconThemeData(
          color: Colors.white,
        )),
    // Text themes
    textTheme: TextTheme(
      headline: TextStyle(
          fontSize: 35,
          fontFamily: "Basier",
          color: Colors.white,
          fontWeight: FontWeight.w300),
      title: TextStyle(
          fontSize: 23, fontWeight: FontWeight.w300, color: Colors.black),
      display1: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      display2: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      body1: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
    ),
  );

  static final ThemeData DarkMoodThemeData = LightMoodThemeData.copyWith(
    // default brightness and colours
    buttonColor: Color.fromRGBO(60, 60, 60, 1),
    canvasColor: Color.fromRGBO(45, 45, 45, 1.0),
    textSelectionColor: Color.fromRGBO(100, 100, 100, 1.0),
//      brightness: Brightness.dark,
    // Icon Themes
    iconTheme: IconThemeData(
      color: Colors.white,
    ),

    appBarTheme: AppBarTheme(
        color: Color.fromRGBO(60, 60, 60, 1),
        iconTheme: IconThemeData(
          color: Colors.white,
        )),
    // Text themes
    textTheme: TextTheme(
      headline: LightMoodThemeData.textTheme.headline.copyWith(
        color: Colors.white,
      ),
      display1: LightMoodThemeData.textTheme.display1.copyWith(
        color: Colors.white,
      ),
      body1: LightMoodThemeData.textTheme.body1.copyWith(
        color: Colors.white,
      ),
      title: LightMoodThemeData.textTheme.title.copyWith(
        color: Colors.white,
      ),
    ),
  );
}
