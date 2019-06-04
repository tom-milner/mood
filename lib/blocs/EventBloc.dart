import "dart:async";
import 'package:mood_app/models/Event/Tag.dart';
import "package:mood_app/services/EventService/EventService.dart";
import "package:mood_app/models/Event/Event.dart";
import 'package:mood_app/services/EventService/TagService.dart';

class EventBloc {
  // set up controller and stream
  final StreamController<List<Event>> _eventController =
      StreamController<List<Event>>.broadcast();
  final _eventService = EventService();
  final _tagService = TagService();
  get events => _eventController.stream;

  EventBloc() {
    getAllEvents();
  }

  dispose() {
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
    // create tags
    for(int i = 0 ; i < newEvent.tags.length; i++){
      newEvent.tags[i] = await _tagService.createTag(newEvent.tags[i]);
    }
    // create event
    newEvent = await _eventService.createNewEvent(newEvent);

    // create EventTag linking the tags to events
    await _eventService.createEventTags(newEvent);

    // refresh events
    getAllEvents();
  }
}
