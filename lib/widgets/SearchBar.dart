import "package:flutter/material.dart";
import 'package:mood_app/blocs/FilterScenariosBloc.dart';

class SearchBar extends StatefulWidget {
  _SearchBarState createState() => _SearchBarState();


}

class _SearchBarState extends State<SearchBar>{

  FilterScenariosBloc _filterScenariosBloc = FilterScenariosBloc();



  @override
  Widget build(BuildContext context) {
    // function to filter the scenarios depending ton the users input.
    void filterSearchResults(String query) {
       _filterScenariosBloc.doFilter(query);
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
          style: Theme.of(context).textTheme.body1,
          decoration: InputDecoration(
            hintText: "Search",
            suffixIcon: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColor, width: 2)),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
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
