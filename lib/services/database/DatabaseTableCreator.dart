// class to hold database table creation statements.

class DatabaseTableCreator {
  static const String scenario = ("CREATE TABLE Scenario ("
      "scenarioId INTEGER PRIMARY KEY NOT NULL ,"
      "title TEXT NOT NULL,"
      "content TEXT NOT NULL,"
      "description TEXT NOT NULL,"
      "icon TEXT,"
      "isFavourite INTEGER DEFAULT 0 NOT NULL,"
      "categoryId INTEGER,"
      "FOREIGN KEY (categoryId) REFERENCES Category(categoryId)"
      ")");

  static const String event = ("CREATE TABLE Event ("
      "eventId INTEGER PRIMARY KEY NOT NULL,"
      "title TEXT NOT NULL,"
      "notesDeltaString TEXT,"
      "rating INTEGER NOT NULL,"
      "millisFromEpoch INTEGER NOT NULL"
      ")");

  static const String category = ("CREATE TABLE Category ("
      "categoryId INTEGER PRIMARY KEY NOT NULL,"
      "title TEXT NOT NULL,"
      "color TEXT"
      ")");

}
