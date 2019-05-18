// class to hold database table creation statements.

class DatabaseTableCreator {
  static const String scenario = ("CREATE TABLE Scenario ("
      "scenarioId INTEGER PRIMARY KEY NOT NULL ,"
      "title TEXT NOT NULL,"
      "content TEXT NOT NULL,"
      "icon TEXT,"
      "relevantExercises TEXT,"
      "categoryId INTEGER,"
      "FOREIGN KEY (categoryId) REFERENCES Category(categoryId)"
      ")");

  static const String event = ("CREATE TABLE Event ("
      "eventId INTEGER PRIMARY KEY NOT NULL,"
      "title TEXT NOT NULL,"
      "notes TEXT,"
      "rating INTEGER NOT NULL,"
      "millisFromEpoch INTEGER NOT NULL"
      ")");

  static const String category = ("CREATE TABLE Category ("
      "categoryId INTEGER PRIMARY KEY NOT NULL,"
      "title TEXT NOT NULL,"
      "color TEXT"
      ")");

  static const String exercise = ("CREATE TABLE Exercise ("
      "exerciseId INTEGER PRIMARY KEY NOT NULL,"
      "contentType TEXT NOT NULL,"
      ")");
}
