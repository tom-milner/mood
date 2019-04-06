import 'package:dynamic_theme/dynamic_theme.dart';
import "package:flutter/material.dart";
import "package:mood_app/ui/theme.dart";

class MoodDrawer extends StatefulWidget {

  bool darkThemeActive;
  MoodDrawer(this.darkThemeActive);



  _MoodDrawerState createState() => _MoodDrawerState();
}

class _MoodDrawerState extends State<MoodDrawer> {

  @override
  Widget build(BuildContext context) {


    void changeColor() {
      setState(() {
        print(widget.darkThemeActive);
        if (widget.darkThemeActive) {
          DynamicTheme.of(context).setThemeData(MoodTheme.DarkMoodThemeData);
        } else {
          DynamicTheme.of(context).setThemeData(MoodTheme.LightMoodThemeData);
        }
      });
    }

    return Drawer(
        elevation: 2,
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Text("Dark Theme: ", style: Theme.of(context).textTheme.body1,),
              trailing: Switch(
                  value: widget.darkThemeActive,
                  onChanged: (bool buttonState) {
                    widget.darkThemeActive = buttonState;
                    changeColor();
                  }),

            ),
          ],
        ));
  }
}
