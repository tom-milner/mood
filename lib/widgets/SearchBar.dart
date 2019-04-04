import "package:flutter/material.dart";
import "package:mood_app/ui/theme.dart";

class SearchBar extends StatefulWidget {
  _SearchBarState createState() => _SearchBarState();

  final List<dynamic> searchItems;

  SearchBar({this.searchItems});
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    // function to filter the scenarios depending ton the users input.
    void filterSearchResults(String query) {
      List<String> searchList = List<String>();
//      searchList.addAll()
    }

    return Container(
      width: 280,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 7.5),
      child: Container(
        height: 40,
        child: TextField(
          onChanged: (query) => filterSearchResults(query),
          cursorWidth: 1.5,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: "Search",
            suffixIcon: Icon(
              Icons.search,
              color: MoodThemeData.buttonColor,
            ),
//          contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                borderSide:
                    BorderSide(color: MoodThemeData.buttonColor, width: 2)),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: MoodThemeData.buttonColor, width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
