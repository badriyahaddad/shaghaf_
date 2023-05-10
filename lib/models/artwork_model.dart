// To parse this JSON data, do
//
//     final artWorkModel = artWorkModelFromJson(jsonString);

import 'dart:convert';

class ArtWorkModel {
  ArtWorkModel({
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

  factory ArtWorkModel.fromRawJson(String str) =>
      ArtWorkModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArtWorkModel.fromJson(Map<String, dynamic> json) => ArtWorkModel(
        artistName: json["artistName"],
        catagoryAr: json["catagoryAr"],
        catagoryEn: json["catagoryEn"],
        discription: json["discription"],
        image: json["image"],
        price: json["price"],
        uid: json["uid"],
        artistImage: json["artistImage"],
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
