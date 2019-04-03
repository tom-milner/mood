import 'package:flutter/material.dart';

class Scenario {

  final String title ;
  final String content ;
  final String icon ;
//  final DocumentReference reference;


  Scenario(this.title, this.content, this.icon);

//
  Scenario.fromMap(Map<String, dynamic> map,)
    :assert(map["title"] != null),
  assert(map["content"] != null),
  assert(map["icon"] != null),
  title = map["title"],
  content = map["content"],
  icon = map["icon"];


//  Scenario.fromSnapshot(DocumentSnapshot snapshot)
//    :this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Scenario<$title,$content>";

}
