import "package:mood_app/models/Event/Event.dart";
import 'package:mood_app/models/Event/Tag.dart';
import 'package:mood_app/services/EventService/TagService.dart';
import 'package:mood_app/services/database/DatabaseService.dart';
import 'package:sqflite/sqflite.dart';

class EventService {
  String tableName = "Event";
  DatabaseService dbService = DatabaseService.dbService;
  TagService _tagService = TagService();

  Future<List<Event>> getAllEvents() async {
    final db = await dbService.database;

    // get whole events table
    var res = await db.query(tableName);
    if (res.isNotEmpty) {
      var events =  res.map((event) => Event.fromMap(event)).toList();

      for(int i = 0; i < events.length; i++){
        events[i].tags = await _tagService.getTagsFromEvent(events[i]);
      }
      return events;
    }
    return [];
  }

  // get events within bounds
  getEventsAtTime(int earliestTime, int latestTime) async {
    final db = await dbService.database;

    // build query
    // QUERY: SELECT * FROM Events WHERE millisFromEpoch <= latestTime AND millisFromEpoch >= earliestTime
    String query =
        "SELECT * FROM '$tableName' WHERE millisFromEpoch <= $latestTime AND millisFromEpoch >= $earliestTime";

    // Perform query
    var res = await db.rawQuery(query);
    if (res.isNotEmpty) {
      return res.map((event) => Event.fromMap(event)).toList();
    }
    return [];
  }

//  getEventById(Event event) async {
//    final db = await dbService.database;
//    return event;
//  }

  // function to add a new event to the database/calendar
  createNewEvent(Event newEvent) async {
    // wait for database service to free up
    final Database db = await dbService.database;

    // insert event into db
    newEvent.id = await db.insert(tableName, newEvent.toMap());
    return newEvent;
  }

  // create links between event and tags
  createEventTags(Event newEvent) async {
    final Database db = await dbService.database;

    // create entries in EventTag linking events with tags
    for (Tag tag in newEvent.tags) {

      var eventTag = <String, dynamic>{
        "eventId": newEvent.id,
        "tagId": tag.id
      };


      await db.insert("EventTag", eventTag);
    }
  }
}
