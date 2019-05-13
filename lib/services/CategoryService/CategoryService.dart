

import 'package:flutter/material.dart';
import 'package:mood_app/models/Category.dart';
import 'package:mood_app/models/Scenario.dart';
import 'package:mood_app/services/database/DatabaseService.dart';

class CategoryService {
  String tableName = "Category";
  DatabaseService dbService = DatabaseService.dbService;

  Future<List<Category>> getAllCategories() async {
    final db = await dbService.database;

    var res = await db.query(tableName);

    if(res.isNotEmpty){
      return res.map((category)=>Category.fromMap(category)).toList();
    }    return [];
  }

//  Future<Category> getCategoryOfScenario(Scenario scenario) async {
//    final db = await dbService.database;
//    String scenarioCategory = scenario.category.title;
//    String query = "SELECT * FROM $tableName WHERE "
//    var res = await db
//  }

// testing

  Future<Category> insertCategory(Category category) async {
    final db = await dbService.database;
    await db.insert(tableName, category.toMap());
    return category;
  }


}
