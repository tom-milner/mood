import 'package:flutter/material.dart';
import 'package:mood_app/models/Event/Tag.dart';

class MoodTagBox extends StatelessWidget {
  final Tag tag;

  const MoodTagBox({Key key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Theme.of(context).primaryColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
      margin: EdgeInsets.only(right: 5),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            tag.title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .body1
                .copyWith(color: Theme.of(context).buttonColor),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.clear,
            size: 15,
            color: Theme.of(context).buttonColor,
          )
        ],
      ),
    );
  }
}
