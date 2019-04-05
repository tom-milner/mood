import "package:flutter/material.dart";
import "package:mood_app/blocs/ChangeThemeBloc.dart";

class MoodDrawer extends StatelessWidget {
  final changeThemeBloc = ChangeThemeBloc();
  bool darkThemeActive = false;

  @override
  Widget build(BuildContext context) {


    return Drawer(
        elevation: 2,
        child: ListView(
          children: <Widget>[
            StreamBuilder(
              initialData: darkThemeActive,
                stream: changeThemeBloc.darkThemeEnabled,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListTile(
                    leading: Text("Dark Theme: "),
                    trailing: Switch(
                        value: snapshot.data,
                        onChanged: (bool buttonState){
                          darkThemeActive = buttonState;
                          changeThemeBloc.changeTheme(darkThemeActive);
                        }),
                  );
                })
          ],
        ));
  }
}
