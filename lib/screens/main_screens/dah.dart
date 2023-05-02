import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/artist_model.dart';

class ArtistProvider with ChangeNotifier {
  List<ArtistModel> items = [];
  Future<void> loadArtistFromFirestore() async {
    final artistsRef = FirebaseFirestore.instance.collection('artists');
    artistsRef.snapshots().listen((artistsSnapshot) {
      final artistsData = artistsSnapshot.docs;
      final List<ArtistModel> loadedArtists = [];
      for (var doc in artistsData) {
        loadedArtists.add(ArtistModel.fromJson(doc.data()));
      }
      items = loadedArtists;
      notifyListeners();
    });
  }
}
