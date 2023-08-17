class User {
  int? id;
  String? userName;
  String? phone;
  int? permission;
  int? status;
  String? image;

  User(
      {this.id,
      this.userName,
      this.phone,
      this.permission,
      this.status,
      this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    phone = json['phone'];
    permission = json['permission'];
    status = json['status'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['phone'] = phone;
    data['permission'] = permission;
    data['status'] = status;
    data['image'] = image;
    return data;
  }
}
