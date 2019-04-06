
import 'dart:async';

import 'package:mood_app/blocs/ScenarioBloc.dart';
import 'package:mood_app/models/Scenario.dart';

class FilterBloc{

  // stream - only need one listener
  final _searchController = StreamController<List<Scenario>>();
  final _scenarioBloc = ScenarioBloc();

  get fileredScenarios => _searchController.stream;

  List<Scenario> filteredList;

  SearchBloc(){
    _scenarioBloc.getAllScenarios().then((scenarios)=> filteredList = scenarios).then(print(filteredList));
  }

  getFilteredList


  dispose(){
    // close stream when not in use to save resources.
    _scenarioBloc.dispose();
    _searchController.close();
  }
}