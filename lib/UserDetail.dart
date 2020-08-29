class UserDetail {
  int index;
  String name;
  String title;
  String address;
  String phone;

  UserDetail(this.index, this.name, this.title, this.address, this.phone);

  UserDetail.fromJson(Map<String, dynamic> json){
    index = json['index'];
    name = json['name'];
    title = json['title'];
    address = json['address'];
    phone = json['phone'];
  }
}