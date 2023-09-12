import 'dart:convert';

class LoginResult {
  String? accessToken;
  final String? refreshToken;
  final User? info;

  LoginResult({
    this.accessToken,
    this.refreshToken,
    this.info,
  });

  factory LoginResult.fromJson(String str) =>
      LoginResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResult.fromMap(Map<String, dynamic> json) => LoginResult(
        accessToken: json["accessToken"],
        refreshToken: json["refresh_token"],
        info: json["info"] == null ? null : User.fromMap(json["info"]),
      );

  Map<String, dynamic> toMap() => {
        "accessToken": accessToken,
        "refresh_token": refreshToken,
        "info": info?.toMap(),
      };
}

class User {
  final int? id;
  final dynamic userName;
  final String? phone;
  final String? email;
  final int? status;
  final dynamic image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.id,
    this.userName,
    this.phone,
    this.email,
    this.status,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        userName: json["user_name"],
        phone: json["phone"],
        email: json["email"],
        status: json["status"],
        image: json["image"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_name": userName,
        "phone": phone,
        "email": email,
        "status": status,
        "image": image,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
