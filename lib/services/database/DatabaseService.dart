import 'dart:io';

import 'package:mood_app/services/database/DatabaseSeeder.dart';
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
      print(e.toString());
    }
  }

  void _onCreate(Database db, int version) async {
    await db.execute(DatabaseTableCreator.category);
    await db.execute(DatabaseTableCreator.scenario);
    await db.execute(DatabaseTableCreator.event);
    await db.execute(DatabaseTableCreator.tag);
    await db.execute(DatabaseTableCreator.eventTag);
    await DatabaseSeeder.seedDb(db);
  }

  Future closeDb() async {
    var dbClient = await database;
    return dbClient.close();
  }

}


