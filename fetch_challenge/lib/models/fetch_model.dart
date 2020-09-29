/// int id : the id of the object;
/// int listId: the grouping id (1-4);
/// String name: "Item $id";
class Fetch {
  int id;
  int listId;
  String name;

  Fetch({this.id, this.listId, this.name});

  /// Maps json into objects of Fetch
  Fetch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    listId = json['listId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['listId'] = this.listId;
    data['name'] = this.name;
    return data;
  }
}
