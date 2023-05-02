import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    required this.catagoryAr,
    required this.catagoryEn,
    required this.image,
    required this.price,
    required this.titleAr,
    required this.titleEn,
    required this.quantity,
  });

  String catagoryAr;
  String catagoryEn;
  String image;
  int price;
  String titleAr;
  String titleEn;
  int quantity;
  factory CartModel.fromRawJson(String str) =>
      CartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        catagoryAr: json["catagoryAr"] ?? '',
        catagoryEn: json["catagoryEn"] ?? '',
        image: json["image"] ?? '',
        price: json["price"],
        titleAr: json["titleAr"] ?? '',
        titleEn: json["titleEn"] ?? '',
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "catagoryAr": catagoryAr,
        "catagoryEn": catagoryEn,
        "image": image,
        "price": price,
        "titleAr": titleAr,
        "titleEn": titleEn,
        "quantity": quantity,
      };
}
