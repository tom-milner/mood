import "package:flutter/material.dart";
import "package:mood_app/ui/theme.dart";


// card content model
//class MoodCardContent {
//  final String title;
//  final IconData icon;
//  MoodCardContent(this.title, this.icon);
//}
//

class MoodCard extends StatefulWidget {

  final String title;
  final IconData icon;
  MoodCard(this.title, this.icon);

//
//  static final MoodCardContent content = MoodCardContent(title, icon);
//

  _MoodCardState createState() => _MoodCardState();

}


class _MoodCardState extends State<MoodCard>{



  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      child: Container(

        decoration: BoxDecoration(
          color: MoodThemeData.primaryColor,
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        ),
        child: _makeListTile(widget),
      ),
    );

  }


// helper methods
  Widget _makeListTile(widget) {
    return new ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      onTap: (){
        // TODO: Moodcard button navigation
      },

      leading: Container(
        padding: EdgeInsets.only(right: 30.0),
        margin: EdgeInsets.only(right: 20.0),
        decoration: new BoxDecoration(

            border: new Border(
                right: new BorderSide(width: .5, color: MoodThemeData.buttonColor))),
        child: Icon(widget.icon, color: MoodThemeData.buttonColor, size: 30.0,),
      ),
      title: new Text(
        widget.title,
        style: new TextStyle(
            color: MoodThemeData.buttonColor,
            fontWeight: FontWeight.w300,
            fontSize: 25.0),
        textAlign: TextAlign.left,
      ),

      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: MoodThemeData.buttonColor,
        size: 40.0,
      ),
    );
  }

}