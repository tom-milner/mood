import "dart:async";
import "package:mood_app/services/EventService.dart";
import "package:mood_app/models/Event.dart";

class EventBloc {
  // set up controller and stream
  final StreamController<List<Event>> _eventController =
      StreamController<List<Event>>.broadcast();
  final _eventService = EventService();
  get events => _eventController.stream;

  EventBloc() {
    getAllEvents();
  }

  // return all of the events
  getAllEvents() async {
    _eventController.sink.add(await _eventService.getAllEvents());
  }

  // create new event
  createNewEvent(Event newEvent) async {
    await _eventService.createNewEvent(newEvent);
    // refresh events
    getAllEvents();
  }
}
