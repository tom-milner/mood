import 'dart:io';

import 'package:mood_app/models/Category.dart';
import 'package:mood_app/models/Scenario.dart';
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
      // TODO: delete in prod
      await deleteDatabase(path);
      return await openDatabase(path,
          version: 1, onOpen: (db) {}, onCreate: _onCreate);
    } catch (e) {
      print("Error opening database");
      print(e.toString());
    }
  }

  void _onCreate(Database db, int version) async {
    await db.execute(DatabaseTableCreator.category);
    await db.execute(DatabaseTableCreator.scenario);
    await db.execute(DatabaseTableCreator.event);
    await seedDb(db);
  }

  Future closeDb() async {
    var dbClient = await database;
    return dbClient.close();
  }

  seedDb(Database db) async {
    for (var cat in DummyData.dummyCategories) {
      await db.insert("Category", cat.toMap());
    }
    var scenarios = DummyData.dummyScenarios;
    var res = await db.query("Category");
    var categories = res.map((category) => Category.fromMap(category)).toList();
    // assign category to scenario
    for (Scenario scen in scenarios) {
      scen.categoryId = categories[0].id;
      await db.insert("Scenario", scen.toMap());
    }
  }
}

// testing data
class DummyData {
  static List<Category> dummyCategories = [
    Category(title: "School", color: "Green")
  ];
  static List<Scenario> dummyScenarios = [
    Scenario(
      title: "Exams",
      content: "cdfdlv",
    ),
    Scenario(
      title: "Friends",
      content: "cdfdlv",
    ),
    Scenario(
      title: "Homework",
      content: "cdfdlv",
    ),
  ];
}
