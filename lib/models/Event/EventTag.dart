class EventTag {
  int eventId;
  int tagId;

  EventTag({this.eventId, this.tagId});

  EventTag.fromMap(Map<String, dynamic> map)
      : assert(map["eventId"] != null),
        assert(map["tagId"] != null);

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      "tagId":tagId,
      "eventId":eventId
    };
    return map;
  }
}
