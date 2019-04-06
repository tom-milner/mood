import "package:flutter/material.dart";

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
      color: Theme.of(context).buttonColor,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: (widget.child),
    );
  }
}
