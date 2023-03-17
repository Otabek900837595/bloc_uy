
class Post {
  String? id;
  String? name;
  // String? title;
  // String? body;
  // int? userId;

  Post({this.id, this.name});

  Post.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() => {
    "id" : id,
    "name" : name,
  };
}



