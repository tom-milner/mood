import "dart:async";
import 'package:mood_app/models/Category.dart';
import "package:mood_app/services/ScenarioService.dart";
import 'package:mood_app/models/Scenario.dart';

class ScenarioBloc {
  final _scenarioService = ScenarioService();

  // broadcast - stream can have multiple listeners
  final _scenarioController = StreamController<List<Scenario>>();
  get scenarios => _scenarioController.stream;

  // for filtered scenarios
  final _filteredScenarioController =
      StreamController<List<Scenario>>.broadcast();
  get filteredScenarios => _filteredScenarioController.stream;

  ScenarioBloc() {
    getAllScenarios();
  }

  dispose() {
    // close stream when not in use to save resources
    _scenarioController.close();
    _filteredScenarioController.close();
  }

  // get favorite Scenarios
  getFavouriteScenarios() async {
    _filteredScenarioController.sink.add(await _scenarioService.getFavouriteScenarios());
  }

// get scenarios of category
  getScenariosOfCategory(Category category) async {
    _filteredScenarioController.sink
        .add(await _scenarioService.getScenariosOfCategory(category));
  }

// get all the scenarios
  getAllScenarios() async {
    _scenarioController.sink.add(await _scenarioService.getAllScenarios());
  }

}
