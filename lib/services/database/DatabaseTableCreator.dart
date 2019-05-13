
// class to hold database table creation statements.

class DatabaseTableCreator {
  static const String scenario = (
      "CREATE TABLE Scenario ("
      "scenarioId INTEGER PRIMARY KEY NOT NULL ,"
      "title TEXT,"
      "content TEXT,"
      "icon TEXT,"
  "categoryId INTEGER,"
      // Exercise IDs are stored in CSV format
      "relevantExercises TEXT"
      ")");

  static const String event = (
    "CREATE TABLE Event ("
      "eventId INTEGER PRIMARY KEY NOT NULL,"
      "title TEXT,"
      "notes TEXT,"
      "rating INTEGER,"
      "millisFromEpoch INTEGER"
      ")"
  );

  static const String category =(
    "CREATE TABLE Category ("
      "categoryId INTEGER PRIMARY KEY NOT NULL,"
      "title TEXT,"
      "color TEXT"
      ")"
  );
}
