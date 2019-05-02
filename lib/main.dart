import "package:flutter/material.dart";
import 'package:mood_app/ui/theme.dart';
import "package:mood_app/pages/main/main.dart";
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

// set local to en_UK
void main() =>
    initializeDateFormatting("en_GB", null).then((_) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  bool isDarkTheme = false;
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        // TODO: Use brightness to determine theme
        data: (brightness) => MoodTheme.LightMoodThemeData.copyWith(),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Mood",
            theme: theme,
            home: Main(),
          );
        });
  }
}
