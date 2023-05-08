// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

class UserModel {
  String? uid;
  String? email;
  String? image;
  bool? isAdmin;
  String? name;
  String? password;

  UserModel({
    this.uid,
    this.email,
    this.image,
    this.isAdmin,
    this.name,
    this.password,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"] ?? '',
        email: json["email"] ?? '',
        image: json["image"] ?? '',
        isAdmin: json["isAdmin"] ?? '',
        name: json["name"] ?? '',
        password: json["password"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "image": image,
        "isAdmin": isAdmin,
        "name": name,
        "password": password,
      };

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'image': image,
      'name': name,
      'isAdmin': isAdmin,
    };
  }
}
