import 'package:mood_app/models/Event/Tag.dart';
import "package:mood_app/services/database/DatabaseService.dart";

class TagService {
  DatabaseService dbService = DatabaseService.dbService;
  String tableName = "Tag";

// create a new tag
  createTag(String tagTitle) async {
    final db = await dbService.database;

    Tag tag = new Tag(title: tagTitle);

    await db.insert(tableName, tag.toMap());
  }

  // get tag of Id
  getTagOfId(Tag tag) async {
    final db = await dbService.database;
    var res = await db
        .query(tableName, where: "tagId = ?", whereArgs: [tag.id]);
    if (res.isNotEmpty) return Tag.fromMap(res.first);
    return null;
  }


// get tag by title
  getTagOfTitle(Tag tag) async {
    final db = await dbService.database;
    var res = await db
        .query(tableName, where: "title= ?", whereArgs: [tag.title]);
    if (res.isNotEmpty) return Tag.fromMap(res.first);
    return null;
  }


}
