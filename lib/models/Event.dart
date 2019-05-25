import 'dart:convert';

import "package:intl/intl.dart";
import 'package:quill_delta/quill_delta.dart';

class Event {
  int id;
  String title;
  String notesDeltaString;
  int rating;
  int millisFromEpoch;

  Event({this.title,this.rating, this.millisFromEpoch});

  Event.fromMap(Map<String, dynamic> map)
      : assert(map["title"] != null),
        assert(map["notesDeltaString"] != null),
        assert(map["rating"] != null),
        assert(map["millisFromEpoch"] != null),
        title = map["title"],
        notesDeltaString = map["notesDeltaString"],
        rating = map["rating"],
        millisFromEpoch = map["millisFromEpoch"];

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "title":title,
      "notesDeltaString":notesDeltaString,
      "rating":rating,
      "millisFromEpoch":millisFromEpoch
    };
    if(id != null){
      map["id"] = id;
    }
    return map;
  }

  Delta getDelta(){
    return Delta.fromJson(json.decode(notesDeltaString) as List);
  }

   setNotesDeltaString(Delta delta){
    notesDeltaString = json.encode(delta);
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
