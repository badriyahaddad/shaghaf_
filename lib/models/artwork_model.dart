// To parse this JSON data, do
//
//     final artWorkModel = artWorkModelFromJson(jsonString);

import 'dart:convert';

class ArtWorkModel {
  ArtWorkModel({
    required this.artistName,
    required this.catagoryAr,
    required this.catagoryEn,
    required this.discription,
    required this.image,
    required this.price,
  });

  String artistName;
  String catagoryAr;
  String catagoryEn;
  String discription;
  String image;
  int price;

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
      );

  Map<String, dynamic> toJson() => {
        "artistName": artistName,
        "catagoryAr": catagoryAr,
        "catagoryEn": catagoryEn,
        "discription": discription,
        "image": image,
        "price": price,
      };
}
