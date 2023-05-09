// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

class UserModel {
  String? uid;
  String? email;
  String? image;
  String? catagory;
  String? name;
  String? password;

  UserModel({
    this.uid,
    this.email,
    this.image,
    this.catagory,
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
        catagory: json["catagory"] ?? '',
        name: json["name"] ?? '',
        password: json["password"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "image": image,
        "name": name,
        "catagory": catagory,
        "password": password,
      };

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'image': image,
      'catagory': catagory,
      'name': name,
    };
  }
}
