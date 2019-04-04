import "package:mood_app/models/Scenario.dart";
import "package:mood_app/services/database/DatabaseService.dart";
import "package:sqflite/sqflite.dart";

class ScenarioService {
  String tableName = "Scenarios";
  DatabaseService dbService = DatabaseService.dbService;
  Database db;

  Future<List<Scenario>> getAllScenarios() async {
    await newScenario();

    final db = await dbService.database;
    // get whole Scenarios table
    var res = await db.query(tableName);
    if (!res.isNotEmpty)
      print(res.map((scenario) => Scenario.fromMap(scenario)).toList());
      return res.map((scenario) => Scenario.fromMap(scenario)).toList();
    return [];
  }

  newScenario() async {
    final db = await dbService.database;
    
//    print(await db.rawQuery("Select * FROM Scenarios"));


    print(await db.query("Scenarios"));
    var table = await db.rawQuery("SELECT MAX(scenarioId)+1 as scenarioId FROM Scenarios");

    print(table);

    int id = table.first["id"];

    var raw = await db.rawInsert(
        "INSERT into Scenarios (scenarioId,title,content,icon)"
        "Values (?,?,?,?)",
        [id, "34242", "vcsdvfdf", "fcdsfgs"]);

    return raw;
  }
}
