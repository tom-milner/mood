import "dart:async";
import "package:mood_app/services/ScenarioService.dart";
import 'package:mood_app/models/Scenario.dart';


class ScenarioBloc {

  // broadcast - stream can have multiple listeners
  final _scenarioController = StreamController<List<Scenario>>.broadcast();
  final _scenarioService = ScenarioService();
  get scenarios => _scenarioController.stream;

  ScenarioBloc() {
    getAllScenarios();
  }

  dispose(){
    // close stream when not in use to save resources
    _scenarioController.close();
  }



// get all the scenarios
 getAllScenarios() async {
    _scenarioController.sink.add(await _scenarioService.getAllScenarios());
  }





}
