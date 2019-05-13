import "package:mood_app/models/Scenario.dart";
import "package:mood_app/services/database/DatabaseService.dart";



class ScenarioService {

  String tableName = "Scenario";
  DatabaseService dbService = DatabaseService.dbService;

  Future<List<Scenario>> getAllScenarios() async {

    final db = await dbService.database;
    // get whole Scenarios table
    var res = await db.query(tableName);
    if (res.isNotEmpty) {
      return res.map((scenario) => Scenario.fromMap(scenario)).toList();
    }
    return [];
  }

  Future<List<Scenario>> getScenariosOfCategory() async {
    final db = await dbService.database;
  }

}
