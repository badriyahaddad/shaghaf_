// To parse this JSON data, do
//
//     final HistoryModel = HistoryModelFromJson(jsonString);

import 'dart:convert';

class HistoryModel {
  HistoryModel({
    this.artistName,
    this.catagoryAr,
    this.catagoryEn,
    this.discription,
    this.image,
    this.uid,
    this.price,
    this.artistImage,
  });

  String? artistName;
  String? catagoryAr;
  String? catagoryEn;
  String? discription;
  String? image;
  String? uid;
  dynamic price;
  String? artistImage;

  factory HistoryModel.fromRawJson(String str) =>
      HistoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        artistName: json["artistName"] ?? "",
        catagoryAr: json["catagoryAr"] ?? "",
        catagoryEn: json["catagoryEn"] ?? "",
        discription: json["discription"] ?? "",
        image: json["image"] ?? "",
        price: json["price"],
        uid: json["uid"] ?? "",
        artistImage: json["artistImage"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "artistName": artistName,
        "catagoryAr": catagoryAr,
        "catagoryEn": catagoryEn,
        "discription": discription,
        "image": image,
        "price": price,
        "uid": uid,
        "artistImage": artistImage,
      };
  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      "artistName": artistName,
      "catagoryAr": catagoryAr,
      "catagoryEn": catagoryEn,
      "discription": discription,
      "image": image,
      "price": price,
      "uid": uid,
      "artistImage": artistImage,
    };
  }
}
