import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mood_app/utils/Utils.dart';
import 'package:quill_delta/quill_delta.dart';

class Scenario {
   int id;
   String title;
   String contentDeltaString;
   String description;
   String icon;
   int categoryId;
   bool isFavourite;

  Scenario({this.id, this.title, this.contentDeltaString, this.description, this.icon, this.categoryId, this.isFavourite});

  Scenario.fromMap(
    Map<String, dynamic> map,
  )   : assert(map["title"] != null),
        assert(map["contentDeltaString"] != null),
        assert(map["description"] != null),
        id = map["scenarioId"],
        title = map["title"],
        description = map["description"],
        contentDeltaString = map["contentDeltaString"],
        categoryId = map["categoryId"],
        isFavourite = Utils.boolFromInt(map["isFavourite"]),
        icon = map["icon"];

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      "title":title,
      "contentDeltaString":contentDeltaString,
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


  Delta getContentDelta(){
    return Delta.fromJson(json.decode(contentDeltaString) as List);
  }

  setContentDeltaString(Delta contentDelta){
    contentDeltaString = json.encode(contentDelta);
  }


  Scenario.fromSnapshot(AsyncSnapshot snapshot) : this.fromMap(snapshot.data);

  @override
  String toString() => "Scenario<$id,$title,$description>";
}
