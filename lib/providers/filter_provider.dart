import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/filter_model.dart';

class FilterProvider with ChangeNotifier {
  List<FilterModel> items = [];
  List<FilterModel> get item => items;

  Future<void> loadFilterFromFirestore() async {
    final cartItemsRef = FirebaseFirestore.instance.collection('filter');
    cartItemsRef.snapshots().listen((cartItemsSnapshot) {
      final cartItemsData = cartItemsSnapshot.docs;
      final List<FilterModel> loadedCartItems = [];
      for (var doc in cartItemsData) {
        loadedCartItems.add(FilterModel.fromJson(doc.data()));
      }
      items = loadedCartItems;
      notifyListeners();

      if (kDebugMode) {
        print('Loaded ${items.length} filter from Firestore');
      }
    });
  }
}
