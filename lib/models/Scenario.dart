import 'package:flutter/material.dart';
import 'package:mood_app/utils/Utils.dart';

class Scenario {
   int id;
   String title;
   String content;
   String description;
   String icon;
   int categoryId;
   bool isFavourite;

  Scenario({this.id, this.title, this.content,this.description, this.icon, this.categoryId, this.isFavourite});

  Scenario.fromMap(
    Map<String, dynamic> map,
  )   : assert(map["title"] != null),
        assert(map["content"] != null),
        assert(map["description"] != null),
        id = map["scenarioId"],
        title = map["title"],
        description = map["description"],
        content = map["content"],
        categoryId = map["categoryId"],
        isFavourite = Utils.boolFromInt(map["isFavourite"]),
        icon = map["icon"];

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      "title":title,
      "content":content,
      "description":description,
      "icon":icon,
      "categoryId":categoryId,
      "isFavourite": Utils.intFromBool(isFavourite)
    };
    if(id != null){
      map["scenarioId"] = id;
    }
    return map;
  }


  Scenario.fromSnapshot(AsyncSnapshot snapshot) : this.fromMap(snapshot.data);

  @override
  String toString() => "Scenario<$id,$title,$description>";
}
