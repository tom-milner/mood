// class to hold database table creation statements.

class DatabaseTableCreator {
// #################################
//            SCENARIOS
// #################################

  static const String scenario = ("CREATE TABLE Scenario ("
      "scenarioId INTEGER PRIMARY KEY NOT NULL ,"
      "title TEXT NOT NULL,"
      "contentDeltaString TEXT NOT NULL,"
      "description TEXT NOT NULL,"
      "icon TEXT,"
      "isFavourite INTEGER DEFAULT 0 NOT NULL,"
      "categoryId INTEGER,"
      "FOREIGN KEY (categoryId) REFERENCES Category(categoryId)"
      ")");

  static const String category = ("CREATE TABLE Category ("
      "categoryId INTEGER PRIMARY KEY NOT NULL,"
      "title TEXT NOT NULL,"
      "color TEXT"
      ")");

// #################################
//            EVENTS
// #################################
  static const String event = ("CREATE TABLE Event ("
      "eventId INTEGER PRIMARY KEY NOT NULL,"
      "title TEXT NOT NULL,"
      "notesDeltaString TEXT,"
      "rating INTEGER NOT NULL,"
      "millisFromEpoch INTEGER NOT NULL"
      ")");


  static const String eventTag = (
  "CREATE TABLE EventTag ("
    "eventId INTEGER NOT NULL,"
    "tagId INTEGER NOT NULL,"
    "foreign key (eventId) references Event(eventId),"
    "foreign key (tagId) references Tag(tagId),"
    "primary key (eventId, tagId)"
      ")"
  );

  static const String tag = (
    "CREATE TABLE Tag ("
      "primary key tagId INTEGER NOT NULL,"
      "title TEXT NOT NULL"
  );
}
