import "package:flutter/material.dart";
import "package:mood_app/ui/theme.dart";

class DashboardItem extends StatefulWidget {
  final String text;
  final IconData icon;

  const DashboardItem([this.text, this.icon]);

  @override
  _DashboardItemState createState() => _DashboardItemState();
}

class _DashboardItemState extends State<DashboardItem> {
  Widget getChild(widget) {
    if (widget.text != null) {
      return new Container (
        padding: EdgeInsets.only(top: 10, left: 10),
        child: new Text(
        widget.text,
        style: new TextStyle(
            color: MoodThemeData.buttonColor,
            fontWeight: FontWeight.w300,
            fontSize: 20.0),
        textAlign: TextAlign.left,
      ),);
    } else {
      return  new IconButton(
        icon: Icon(widget.icon),
        disabledColor: MoodThemeData.buttonColor,
        onPressed: (){},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MoodThemeData.primaryColor,
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: getChild(widget),
    );
  }
}
