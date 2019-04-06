import 'dart:math';

import "package:mood_app/models/Scenario.dart";
import "package:mood_app/services/database/DatabaseService.dart";
import "package:sqflite/sqflite.dart";


// testing data
class DummyData{
  List<Scenario> dummyScenarios = [
  Scenario("hello", "csfdvdfv", "dfcrkdfv"),
  Scenario("goodbye", "csfdvdfv", "dfcrkdfv"),
  Scenario("hi", "csfdvdfv", "dfcrkdfv"),
  Scenario("mental", "csfdvdfv", "dfcrkdfv"),
  Scenario("health", "csfdvdfv", "dfcrkdfv"),
    ];
}


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
    int id = table.first["id"];

    List<Scenario> data = DummyData().dummyScenarios;
    Random random = new Random();
    // get random entry in dummy data
    var randomEntry = data[random.nextInt(data.length - 1)];

    var raw = await db.rawInsert(
        "INSERT into Scenarios (scenarioId,title,content,icon)"
        "Values (?,?,?,?)",
        [id, randomEntry.title, randomEntry.content, randomEntry.icon]);

    return raw;
  }
}
