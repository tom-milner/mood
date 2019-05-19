import 'dart:math';

import 'package:mood_app/models/Category.dart';
import 'package:mood_app/models/Scenario.dart';
import 'package:sqflite/sqlite_api.dart';

// ******************************************************
//              FOR TESTING PURPOSES ONLY
// ******************************************************

class DatabaseSeeder {
  static List<Category> dummyCategories = [
    Category(title: "School", color: "Green"),
    Category(title: "Friends", color: "Green"),
    Category(title: "Relationships", color: "Green"),
    Category(title: "Work", color: "Green"),
    Category(title: "Stress", color: "Green"),
  ];
  static List<Scenario> dummyScenarios = [
    Scenario(
        title: "Struggling With Exams huh uh uh uh ?",
        content: "cdfdlv",
        description: "Here are some tips to get you through exams!."),
    Scenario(
        title: "Feeliong yeety",
        content: "cdfdlv",
        description: "Here are some tips to get you through exams!."),
    Scenario(
        title: "Whoop diddly do",
        content: "cdfdlv",
        description: "Here are some tips to get you through exams!."),
    Scenario(
        title: "Life feeling shite?",
        content: "cdfdlv",
        description: "Here are some tips to get you through exams!."),
    Scenario(
        title: "Struggling With Exams huh uh uh uh ?",
        content: "cdfdlv",
        description: "Here are some tips to get you through exams!."),
    Scenario(
        title: "Struggling With Exams huh uh uh uh ?",
        content: "cdfdlv",
        description: "Here are some tips to get you through exams!."),
  ];

  static seedDb(Database db) async {
    for (var cat in dummyCategories) {
      await db.insert("Category", cat.toMap());
    }
    var scenarios = dummyScenarios;
    var res = await db.query("Category");
    var categories = res.map((category) => Category.fromMap(category)).toList();

    // assign random category to scenario
    var random = Random();
    for (Scenario scen in scenarios) {
      scen.categoryId = categories[random.nextInt(scenarios.length - 1)].id;
      await db.insert("Scenario", scen.toMap());
    }
  }
}
