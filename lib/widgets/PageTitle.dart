import "package:flutter/material.dart";
import "package:mood_app/ui/theme.dart";

class PageTitle extends StatefulWidget {
  final String text;

  const PageTitle(this.text);

  @override
  _PageTitleState createState() => _PageTitleState();
}

class _PageTitleState extends State<PageTitle> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 20),
      child: new Center(
      child: new Text(
        widget.text,
        style: TextStyle(
          fontSize: 40.0,
          fontFamily: "Muli",
          color: MoodThemeData.buttonColor,
          fontWeight: FontWeight.w300
        ),
        textAlign: TextAlign.center,
      ),),
    );
  }
}
