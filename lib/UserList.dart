class UserList{
  int index;
  String name;

  UserList(this.index, this.name);

  UserList.fromJson(Map<String, dynamic> json){
    index = json['index'];
    name = json['name'];
  }
}