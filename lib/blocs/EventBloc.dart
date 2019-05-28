import "dart:async";
import 'package:mood_app/models/Event/Tag.dart';
import "package:mood_app/services/EventService/EventService.dart";
import "package:mood_app/models/Event/Event.dart";

class EventBloc {
  // set up controller and stream
  final StreamController<List<Event>> _eventController = StreamController<List<Event>>.broadcast();
  final _eventService = EventService();
  get events => _eventController.stream;

  EventBloc() {
    getAllEvents();
  }

  dispose(){
    _eventController.close();
  }

  // return all of the events
  getAllEvents() async {
    _eventController.sink.add(await _eventService.getAllEvents());
  }


  // get events for next 5 days
  getNextFiveDays(int currentMillis) async {
    // create bounds (today = currentMillis, 5 days time = maxMillis
    int fiveDaysMillis = 432000000;
    int maxMillis = currentMillis + fiveDaysMillis;

    // get events within bounds
    return _eventService.getEventsAtTime(currentMillis, maxMillis);
    // return events
  }


  // create new event
  createNewEvent(Event newEvent) async {
    await _eventService.createNewEvent(newEvent);
    // refresh events
    getAllEvents();
  }
}
