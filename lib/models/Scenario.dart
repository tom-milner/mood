import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Scenario {

  final String title ;
  final String content ;
  final String icon ;
  final DocumentReference reference;


  Scenario.fromMap(Map<String, dynamic> map, {this.reference})
    :assert(map["title"] != null),
  assert(map["content"] != null),
  assert(map["icon"] != null),
  title = map["title"],
  content = map["content"],
  icon = map["icon"];


  Scenario.fromSnapshot(DocumentSnapshot snapshot)
    :this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Scenario<$title,$content>";

}
