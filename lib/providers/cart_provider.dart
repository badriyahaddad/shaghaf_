import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:shaghaf/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> items = [];
  List<CartModel> cartList = [];
  List<CartModel> get item => items;

  // Future<void> addCartItemToFirebase(CartModel item) async {
  //   final cartItemRef = FirebaseDatabase.instance.ref().child('cart');
  //   final newCartItemRef = cartItemRef.push();
  //   await newCartItemRef.set({
  //     'categoryAr': item.catagoryAr,
  //     'categoryEn': item.catagoryEn,
  //     'image': item.image,
  //     'price': item.price,
  //     'titleAr': item.titleAr,
  //     'titleEn': item.titleEn,
  //   });
  //   notifyListeners();
  // }

  Future<void> loadCartItemsFromFirestore(String? query) async {
    final cartItemsRef = query == null
        ? FirebaseFirestore.instance.collection('cart')
        : FirebaseFirestore.instance
            .collection('cart')
            .where('catagoryAr', isEqualTo: query);
    final cartItemsSnapshot = await cartItemsRef.get();
    final cartItemsData = cartItemsSnapshot.docs;
    final List<CartModel> loadedCartItems = [];
    for (var doc in cartItemsData) {
      loadedCartItems.add(CartModel.fromJson(doc.data()));
    }
    items = loadedCartItems;
    cartList.toSet().toList();
    cartList.clear();
    notifyListeners();
    if (kDebugMode) {
      print('Loaded ${items.length} cart items from Firestore');
    }
  }
}
