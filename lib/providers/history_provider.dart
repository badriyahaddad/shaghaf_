import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shaghaf/models/user_model.dart';
import '../models/history_model.dart';

class HistoryProvider with ChangeNotifier {
  bool isFailed = false;
  bool isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel? currentUserInstant;
  List<HistoryModel> items = [];
  List<HistoryModel> get item => items;

  Future<void> loadHistorytemsFromFirestore() async {
    isLoading = true;

    isFailed = false;
    final historyItemsRef = FirebaseFirestore.instance.collection('history');
    final historyItemsSnapshot = await historyItemsRef.get();
    final historyItemsData = historyItemsSnapshot.docs;
    final List<HistoryModel> loadedhistoryItems = [];
    for (var doc in historyItemsData) {
      loadedhistoryItems.add(HistoryModel.fromJson(doc.data()));
    }
    items = loadedhistoryItems;

    isLoading = false;
    isFailed = true;
    notifyListeners();

    if (kDebugMode) {
      print('Loaded ${items.length} history items from Firestore');
    }
  }

  postDetailsToFirestore(String price, String image, String name,
      String catagoryAr, String catagoryEn, String artistImage) async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    HistoryModel historyModel = HistoryModel();
    // writing all the values

    historyModel.uid = user!.uid;
    historyModel.price = price;
    historyModel.image = image;
    historyModel.artistName = name;
    historyModel.catagoryEn = catagoryEn;
    historyModel.catagoryAr = catagoryAr;
    historyModel.artistImage = artistImage;
    await firebaseFirestore
        .collection("history")
        .doc(user.uid)
        .set(historyModel.toMap());

    notifyListeners();
  }
}
