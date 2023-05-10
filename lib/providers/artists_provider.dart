import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/artist_model.dart';

class ArtistProvider with ChangeNotifier {
  bool isFav = false;
  bool isFailed = false;
  bool isLoading = false;
  ArtistModel? atistName;
  List<ArtistModel> items = [];
  List<ArtistModel> get item => items;
  ArtistModel? selectedArtist;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> loadArtistFromFirestore() async {
    isLoading = true;
    isFailed = false;
    final cartItemsRef = FirebaseFirestore.instance.collection('artist');
    cartItemsRef.snapshots().listen((cartItemsSnapshot) {
      final cartItemsData = cartItemsSnapshot.docs;
      final List<ArtistModel> loadedCartItems = [];
      for (var doc in cartItemsData) {
        loadedCartItems.add(ArtistModel.fromJson(doc.data()));
      }
      items = loadedCartItems;

      isLoading = false;
      isFailed = true;
      notifyListeners();

      if (kDebugMode) {
        print('Loaded ${items.length} artist itesssms from Firestore');
      }
    });
  }

  Future<void> getSingleArtist(String artistID) async {
    var data = await firestore
        .collection('artist')
        .where('uid', isEqualTo: artistID)
        .get();

    selectedArtist = ArtistModel.fromJson(data.docs.first.data());
    print("IMGURL " + selectedArtist!.artistImage.toString());
    notifyListeners();
  }
}
