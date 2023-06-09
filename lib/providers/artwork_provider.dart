import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shaghaf/models/user_model.dart';
import '../models/artwork_model.dart';

class ArtworkProvider with ChangeNotifier {
  bool isFailed = false;
  bool isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel? currentUserInstant;
  List<ArtWorkModel> items = [];
  List<ArtWorkModel> get item => items;

  Future<void> loadArtWorkItemsFromFirestore() async {
    isLoading = true;

    isFailed = false;
    final artworkItemsRef = FirebaseFirestore.instance.collection('artwork');
    final artworkItemsSnapshot = await artworkItemsRef.get();
    final artworkItemsData = artworkItemsSnapshot.docs;
    final List<ArtWorkModel> loadedartworkItems = [];
    for (var doc in artworkItemsData) {
      loadedartworkItems.add(ArtWorkModel.fromJson(doc.data()));
    }
    items = loadedartworkItems;

    isLoading = false;
    isFailed = true;
    notifyListeners();

    if (kDebugMode) {
      print('Loaded ${items.length} artwork items from Firestore');
    }
  }

  postDetailsToFirestore(
    String price,
    String image,
    String discription,
    String catagoryAr,
    String catagoryEn,
    String artistName,
    String artistImage,
  ) async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    ArtWorkModel artWorkModel = ArtWorkModel();
    //UserModel currrentUser = UserModel();
    // writing all the values

    artWorkModel.uid = user!.uid;
    artWorkModel.price = price;
    artWorkModel.image = image;
    artWorkModel.discription = discription;
    artWorkModel.catagoryEn = catagoryEn;
    artWorkModel.catagoryAr = catagoryAr;
    artWorkModel.artistName = artistName;
    artWorkModel.artistImage = artistImage;

    await firebaseFirestore
        .collection("artwork")
        .doc(user.uid)
        .set(artWorkModel.toMap());
    notifyListeners();
  }
}
