import 'package:mood_app/models/Event/Event.dart';
import 'package:mood_app/models/Event/Tag.dart';
import "package:mood_app/services/database/DatabaseService.dart";

class TagService {
  DatabaseService dbService = DatabaseService.dbService;
  String tableName = "Tag";

// create a new tag
  createTag(Tag newTag) async {
    final db = await dbService.database;
    List<Tag> currentTags = [];
    var res = await db.query(tableName);
    if(res.isNotEmpty) {
      currentTags = res.map((tag) => Tag.fromMap(tag)).toList();
    }
    // check if db already contains tag
    bool tagExists = false;
    for(Tag tag in currentTags){
      if(newTag.title == tag.title){
        // tag already exists, so return tag with null id
        tagExists = true;
        newTag.id = tag.id;
      }
    }

    if(!tagExists){
      newTag.id = await db.insert(tableName, newTag.toMap());
    }

    return newTag;
  }

  // get tag of Id
  getTagOfId(Tag tag) async {
    final db = await dbService.database;
    var res = await db
        .query(tableName, where: "tagId = ?", whereArgs: [tag.id]);
    if (res.isNotEmpty) return Tag.fromMap(res.first);
    return null;
  }

  // get tags from event
  getTagsFromEvent(Event event)async{
    final db = await dbService.database;
    List<Tag> tags = [];
    var res = await db.query("EventTag", where: "eventId = ?", whereArgs: [event.id]);

    if(res.isNotEmpty) {
      for(int i = 0; i < res.length; i++){
        Tag tag = new Tag(id: res[i]["tagId"]);
        tag = await getTagOfId(tag);
        tags.add(tag);
      }
    }
    print(tags);
    return tags;
  }

// get tag by title
  getTagOfTitle(Tag tag) async {
    final db = await dbService.database;
    var res = await db
        .query(tableName, where: "title = ?", whereArgs: [tag.title]);
    if (res.isNotEmpty) return Tag.fromMap(res.first);
    return null;
  }


}
