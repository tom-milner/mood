
class Category {
   int id;
   String title;
   String color;

  Category({this.id, this.title, this.color});

  Category.fromMap(Map<String, dynamic> map)
      : assert(map["title"] != null),
        assert(map["color"] != null),
        assert(map["categoryId"] != null),
        title = map["title"],
        id = map["categoryId"],
        color = map["color"];

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      "title":title,
      "color":color
    };
    if(id!=null){
      map["categoryId"] = id;
    }
    return map;
  }


   @override
   String toString() => "Category<$id,$title,$color>";

}
