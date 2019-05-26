import "package:flutter/material.dart";

class MoodSnackBar {
  SnackBar showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        backgroundColor: Theme.of(context).primaryColor,
        content: Text(
          message,
          style:
              Theme.of(context).textTheme.title.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
