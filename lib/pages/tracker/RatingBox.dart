import 'package:flutter/material.dart';

class RatingBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          border: Border.all(color: Theme.of(context).primaryColor)),
      child: Text(
        "1",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
          fontSize: 50,
        )
      ),
    ));
  }
}
