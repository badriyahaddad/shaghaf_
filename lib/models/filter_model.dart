import 'dart:convert';

class FilterModel {
  String catagoryEn;
  String catagoryAr;

  FilterModel({
    required this.catagoryEn,
    required this.catagoryAr,
  });

  factory FilterModel.fromRawJson(String str) =>
      FilterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
        catagoryEn: json["CatagoryEn"] ?? "",
        catagoryAr: json["catagoryAr"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "CatagoryEn": catagoryEn,
        "catagoryAr": catagoryAr,
      };
}
