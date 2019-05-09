import "package:mood_app/models/Event.dart";
import 'package:mood_app/services/database/DatabaseService.dart';
import 'package:sqflite/sqflite.dart';

class EventService {
  String tableName = "Events";
  DatabaseService dbService = DatabaseService.dbService;


  Future<List<Event>> getAllEvents() async {

    final db = await dbService.database;

    // get whole events table
    var res = await db.query(tableName);
    if(res.isNotEmpty){
      return res.map((event) => Event.fromMap(event)).toList();
    }
    return [];
  }

  // get events within bounds
  getEventsAtTime(int earliestTime, int latestTime) async {
    final db = await dbService.database;

    // build query
    // QUERY: SELECT * FROM Events WHERE millisFromEpoch <= latestTime AND millisFromEpoch >= earliestTime
    String query = "SELECT * FROM '$tableName' WHERE millisFromEpoch <= $latestTime AND millisFromEpoch >= $earliestTime";

    // Perform query
    var res = await db.rawQuery(query);
    if(res.isNotEmpty){
      return  res.map((event) => Event.fromMap(event)).toList();
    }
    return [];
  }

  // function to add a new event to the database/calendar
  createNewEvent(Event newEvent) async {
    // wait for database service to free up
    final db = await dbService.database;

    // get current max id, and add 1 to get next id
    var maxIdTable = await db.rawQuery("SELECT MAX(eventId)+1 as eventId FROM $tableName");
    int newId = maxIdTable.first["id"]; // id will be first entry in table

    // execute insert
    var raw = await db.rawInsert(
      "INSERT into Events (eventid, title, notes, rating, millisFromEpoch)"
      "VALUES (?,?,?,?,?)",
      [newId, newEvent.title, newEvent.notes, newEvent.rating, newEvent.millisFromEpoch]
    );

    return raw;
  }


}