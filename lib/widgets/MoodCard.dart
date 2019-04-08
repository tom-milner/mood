import "package:flutter/material.dart";

class MoodCard extends StatefulWidget {
  final Widget child;

  const MoodCard({this.child});

  @override
  _MoodCardState createState() => _MoodCardState();
}

class _MoodCardState extends State<MoodCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Theme.of(context).buttonColor,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: (widget.child),
      ),
    );
  }
}
