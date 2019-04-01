import 'dart:io';

import "package:path/path.dart";
import "package:sqflite/sqflite.dart";
import "package:path_provider/path_provider.dart";

class DatabaseService {
  // make database a singleton - only one instance can exist at once
  DatabaseService._();
  static final DatabaseService db = DatabaseService._();

  Database _database;

  // get the database
  Future<Database> getDatabase(String tableName) async {
    if (_database != null) return _database;
    // if database doesn't exist, lazy instantiate it
    _database = await initDB(tableName);
    return _database;
  }

  // method to create the database
  initDB(String tableName) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
  }
}
