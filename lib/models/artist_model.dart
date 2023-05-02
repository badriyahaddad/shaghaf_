import 'dart:convert';

class ArtistModel {
  String artistImage;
  String artistName;
  String catagoryAr;
  String catagoryEn;

  ArtistModel({
    required this.artistImage,
    required this.artistName,
    required this.catagoryAr,
    required this.catagoryEn,
  });

  factory ArtistModel.fromRawJson(String str) =>
      ArtistModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
        artistImage: json["artistImage"] ?? '',
        artistName: json["artistName"] ?? '',
        catagoryAr: json["catagoryAr"] ?? '',
        catagoryEn: json["catagoryEn"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "artistImage": artistImage,
        "artistName": artistName,
        "catagoryAr": catagoryAr,
        "catagoryEn": catagoryEn,
      };
}
