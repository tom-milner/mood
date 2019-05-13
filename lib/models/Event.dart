import "package:intl/intl.dart";

class Event {
  int id;
  String title;
  String notes;
  int rating;
  int millisFromEpoch;

  Event({this.title, this.notes, this.rating, this.millisFromEpoch});

  Event.fromMap(Map<String, dynamic> map)
      : assert(map["title"] != null),
        assert(map["notes"] != null),
        assert(map["rating"] != null),
        assert(map["millisFromEpoch"] != null),
        title = map["title"],
        notes = map["notes"],
        rating = map["rating"],
        millisFromEpoch = map["millisFromEpoch"];

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "title":title,
      "notes":notes,
      "rating":rating,
      "millisFromEpoch":millisFromEpoch
    };
    if(id != null){
      map["id"] = id;
    }
    return map;
  }

  getDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(millisFromEpoch, isUtc: false);
  }

  getShortDateTime() {
    var dateTime =
        DateTime.fromMillisecondsSinceEpoch(millisFromEpoch, isUtc: true);
    String formattedTime = DateFormat.yMMMd("en_GB").format(dateTime);
    return formattedTime;
  }
}
