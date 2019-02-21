import "package:flutter/material.dart";
import "package:mood_app/ui/theme.dart";

class DashboardItem extends StatefulWidget {
  final String text;
  final IconData icon;

  const DashboardItem(this.icon, this.text);

  @override
  _DashboardItemState createState() => _DashboardItemState();
}

class _DashboardItemState extends State<DashboardItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: MoodThemeData.primaryColor,
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  widget.icon,
                  color: MoodThemeData.buttonColor,
                ),
                new Text(widget.text)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
