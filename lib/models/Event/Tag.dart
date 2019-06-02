class Tag {
  int id;
  String title;

  Tag({this.id, this.title});

  Tag.fromMap(Map<String, dynamic> map)
      : assert(map["title"] != null),
        assert(map["tagId"] != null),
        title = map["title"],
        id = map["tagId"];

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{"title": title};
    if (id != null) {
      map["tagId"] = id;
    }
    return map;
  }

  @override
  String toString() => "Tag<$id,$title>";
}
