class Tag {
  int id;
  String title;

  Tag({this.id, this.title});

  Tag.fromMap(Map<String, dynamic> map)
      : assert(map["tagId"]),
        assert(map["title"]),
        id = map["tagId"],
        title = map["title"];

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      "title" : title
    };
    if(id!=null){
      map["tagId"] = id;
    }
    return map;
  }

}
