import 'package:flutter/material.dart';

class Scenario {
   int id;
   String title;
   String content;
   String icon;
   int categoryId;

  Scenario({this.id, this.title, this.content, this.icon, this.categoryId});

  Scenario.fromMap(
    Map<String, dynamic> map,
  )   : assert(map["title"] != null),
        assert(map["content"] != null),
        id = map["id"],
        title = map["title"],
        content = map["content"],
        categoryId = map["categoryId"],
        icon = map["icon"];


  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      "title":title,
      "content":content,
      "icon":icon,
      "categoryId":categoryId
    };
    if(id != null){
      map["id"] = id;
    }
    return map;
  }

  Scenario.fromSnapshot(AsyncSnapshot snapshot) : this.fromMap(snapshot.data);

  @override
  String toString() => "Scenario<$id,$title,$content>";
}
