import "package:flutter/material.dart";
import "package:mood_app/ui/theme.dart";

class DashboardItem extends StatefulWidget {
  final Widget child;

  const DashboardItem(this.child);

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
      child: (widget.child),
    );
  }
}
