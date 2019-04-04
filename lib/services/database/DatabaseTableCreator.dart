
// class to hold database table creation statements.

class DatabaseTableCreator {
  static const String scenarios = ("CREATE TABLE Scenarios ("
      "scenarioId INTEGER PRIMARY_KEY"
      "title TEXT"
      "content TEXT"
      "icon TEXT"
      // Exercise IDs are stored in CSV format
      "relevantExercises TEXT"
      ")");
}
