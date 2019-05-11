import "package:intl/intl.dart";

class Event {
  final String title;
  final String notes;
  final int rating;
  final int millisFromEpoch;


  Event(this.title, this.notes, this.rating, this.millisFromEpoch);

  Event.fromMap(Map<String,dynamic > map )
      :assert(map["title"] != null),
  assert(map["notes"]!= null),
  assert(map["rating"] != null),
  assert(map["millisFromEpoch"] != null),
  title = map["title"],
  notes = map["notes"],
  rating = map["rating"],
  millisFromEpoch = map["millisFromEpoch"];



  getDateTime() {
    return
        DateTime.fromMillisecondsSinceEpoch(millisFromEpoch, isUtc: false);
  }

  getShortDateTime(){
    var dateTime = DateTime.fromMillisecondsSinceEpoch(millisFromEpoch, isUtc: true);
    String formattedTime = DateFormat.yMMMd("en_GB").format(dateTime);
    return formattedTime;
  }



}
