import 'package:mood_app/models/Category.dart';
import "package:mood_app/models/Scenario.dart";
import "package:mood_app/services/database/DatabaseService.dart";
import 'package:mood_app/utils/Utils.dart';

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

  Future<Scenario> getScenarioOfId(Scenario scenario) async {
    final db = await dbService.database;
    var res = await db
        .query(tableName, where: "scenaroId = ?", whereArgs: [scenario.id]);
    if(res.isNotEmpty){
      return Scenario.fromMap(res.first);
    } else {
      return null;
    }
  }

  Future<List<Scenario>> getFavouriteScenarios() async {
    final db = await dbService.database;
    var query = "SELECT * FROM $tableName WHERE isFavourite = 1";
    var res = await db.rawQuery(query);
    if(res.isNotEmpty){
      return res.map((scenario) => Scenario.fromMap(scenario)).toList();
    } else {
      return [];
    }
  }

  Future<List<Scenario>> getScenariosOfCategory(Category category) async {
    final db = await dbService.database;
    var query = "SELECT * FROM $tableName WHERE categoryId = ${category.id}";
    var res = await db.rawQuery(query);

    if (res.isNotEmpty) {
      return res.map((scenario) => Scenario.fromMap(scenario)).toList();
    }
    return [];
  }

  toggleFavourite(Scenario scenario) async {
    final db = await dbService.database;

    int intFromBool = Utils.intFromBool(!scenario.isFavourite);
    String query =
        "UPDATE $tableName SET isFavourite = $intFromBool WHERE scenarioId = ${scenario.id}";

    var res = await db.rawUpdate(query);
    return Utils.boolFromInt(res);
  }
}
