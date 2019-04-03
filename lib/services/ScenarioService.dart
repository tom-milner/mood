import "package:mood_app/models/Scenario.dart";
import "package:mood_app/services/database/DatabaseService.dart";
import "package:sqflite/sqflite.dart";
class ScenariosService {


  final String tableName = "Scenarios";
  DatabaseService dbService;
  Database db;

  init() async{
    dbService =  DatabaseService.db;
    db = await dbService.getDatabase(tableName);
  }

  Future<List<Scenario>> getAllScenarios() async {
    // get whole Scenarios table
    var res = await db.query(tableName);
    if(!res.isNotEmpty) return res.map((scenario) => Scenario.fromMap(scenario)).toList();
    return [];
  }

}
