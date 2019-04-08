import 'package:flutter/material.dart';

class Scenario {
  final String title ;
  final String content ;
  final String icon ;


  Scenario(this.title, this.content, this.icon);

//
  Scenario.fromMap(Map<String, dynamic> map,)
    :assert(map["title"] != null),
  assert(map["content"] != null),
  assert(map["icon"] != null),
  title = map["title"],
  content = map["content"],
  icon = map["icon"];



  Scenario.fromSnapshot(AsyncSnapshot snapshot)
    :this.fromMap(snapshot.data);

  @override
  String toString() => "Scenario<$title,$content>";

}
