import 'dart:io';

import 'package:mood_app/services/database/DatabaseTableCreator.dart';
import "package:path/path.dart";
import "package:sqflite/sqflite.dart";
import "package:path_provider/path_provider.dart";

class DatabaseService {
  // make database a singleton - only one instance can exist at once
  DatabaseService._();
  static final DatabaseService dbService = DatabaseService._();

  Database _database;

  // get the database
  Future<Database> get database async {
    if (_database != null) return _database;
    // if database doesn't exist, lazy instantiate it
    _database = await initDB();
    return _database;
  }

  // method to create the database
   Future<Database> initDB() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, "MoodDB.db");
     await  deleteDatabase(path);
      return await openDatabase(path, version: 1, onOpen: (db) {},
          onCreate: _onCreate);
    } catch (e) {
      print("Error opening database");
      print(e.toString());
    }
  }

  void _onCreate(Database db, int version) async {
//    await db.execute(DatabaseTableCreator.scenarios);
    await db.execute("CREATE TABLE Scenarios ("
        "scenarioId INTEGER PRIMARY_KEY,"
        "title TEXT,"
        "content TEXT,"
        "icon TEXT,"
    // Exercise IDs are stored in CSV format
        "relevantExercises TEXT"
        ")");
  }


  Future closeDb() async {
    var dbClient = await database;
    return dbClient.close();
  }
}
