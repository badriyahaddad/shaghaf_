import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/artwork_model.dart';

class ArtworkProvider with ChangeNotifier {
  bool isFav = false;
  bool isFailed = false;
  bool isLoading = false;
  Future<void> isFaverite() async {
    isFav = !isFav;
    await saveData();
    notifyListeners();
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFav', isFav);
    notifyListeners();
  }

  List<ArtWorkModel> items = [];
  List<ArtWorkModel> get item => items;

  Future<void> loadArtWorkItemsFromFirestore() async {
    isLoading = true;

    isFailed = false;
    final cartItemsRef = FirebaseFirestore.instance.collection('artwork');
    final cartItemsSnapshot = await cartItemsRef.get();
    final cartItemsData = cartItemsSnapshot.docs;
    final List<ArtWorkModel> loadedCartItems = [];
    for (var doc in cartItemsData) {
      loadedCartItems.add(ArtWorkModel.fromJson(doc.data()));
    }
    items = loadedCartItems;

    isLoading = false;
    isFailed = true;
    notifyListeners();

    if (kDebugMode) {
      print('Loaded ${items.length} artwork items from Firestore');
    }
  }
}
