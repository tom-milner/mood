import "package:flutter/material.dart";
import 'package:mood_app/ui/theme.dart' as Theme;
import "package:mood_app/pages/main/main.dart";
import "package:cloud_firestore/cloud_firestore.dart";


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return new MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "mood",
      theme: new ThemeData(
fontFamily: "Raleway"
      ),
      home: Main(),
    );
  }
}