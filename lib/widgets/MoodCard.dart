import "package:flutter/material.dart";
import "package:mood_app/ui/theme.dart";


// card content model
class MoodCardContent {
  final String title;
  final IconData icon;

  const MoodCardContent(this.title, this.icon);
}


class MoodCard extends StatefulWidget {

  final MoodCardContent content;

  MoodCard(this.content);

  _MoodCardState createState() => _MoodCardState();

}


class _MoodCardState extends State<MoodCard>{



  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 8.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: MoodThemeData.primaryColor,
        ),
        child: _makeListTile(widget.content),
      ),
    );

  }


// helper methods
  Widget _makeListTile(MoodCardContent content) {
    return new ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

      onTap: (){
        // TODO: Moodcard button navigation
      },

      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        margin: EdgeInsets.only(right: 25.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(content.icon, color: Colors.white),
      ),
      title: Text(
        content.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),

      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
        size: 30.0,
      ),
    );
  }

}