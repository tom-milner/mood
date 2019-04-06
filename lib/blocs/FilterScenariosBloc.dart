import 'dart:async';

import 'package:mood_app/blocs/ScenarioBloc.dart';
import 'package:mood_app/models/Scenario.dart';

class FilterScenariosBloc {
  // stream - only need one listener
  final _searchController = StreamController<List<Scenario>>();
  final _scenarioBloc = ScenarioBloc();

  get filteredScenariosStream => _searchController.stream;

  List<Scenario> initialScenarios;
  List<Scenario> filteredScenarios;

  FilterScenariosBloc() {
    _scenarioBloc
        .getAllScenarios()
        .then((scenarios) => initialScenarios = scenarios)
        .then(getFilteredScenarios())
        .error(print((error) => "Error fetching scenarios: $error "));
  }

  // add filtered list to stream
  getFilteredScenarios() {
    _searchController.sink.add(filteredScenarios);
  }

  // filter list depending on search term (String term)
  doFilter(String term) {
    // find matches
    print(initialScenarios);
    initialScenarios.forEach((scenario){
      if(scenario.title.contains(term)){
        filteredScenarios.add(scenario);
      }
    });
    // return updated list
    getFilteredScenarios();
  }

  dispose() {
    // close stream when not in use to save resources.
    _scenarioBloc.dispose();
    _searchController.close();
  }
}
