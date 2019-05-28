import "package:flutter/material.dart";

class MoodCard extends StatefulWidget {
  final Widget child;
  final Color color;
  const MoodCard({this.child, this.color});

  @override
  _MoodCardState createState() => _MoodCardState();
}

class _MoodCardState extends State<MoodCard> {
  var cardColor;
  @override
  Widget build(BuildContext context) {
    if (widget.color != null) {
      cardColor = widget.color;
    } else {
      cardColor = Theme.of(context).buttonColor;
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      clipBehavior: Clip.antiAlias,
      color: cardColor,
      elevation: 2.0,
      child: (widget.child),
    );
  }
}
