import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shaghaf/screens/main_screens/bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../widgets/dialogs/password_reseted_dialog.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<UserModel> users = [];
  UserModel? userRoleBase;
  List<UserModel> get userShaghaf => users;
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Stream<User?> get authStateChanges {
    return _auth.authStateChanges();
  }

  Future<void> signUp(String email, String password, String name,
      String catagory, String image) async {
    if (!EmailValidator.validate(email)) {
      if (kDebugMode) {
        print('Invalid email format');
      }
      return;
    }
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          )
          .then((value) => postDetailsToFirestore(name, image, catagory));

      User? user = result.user;
      if (user != null) {
        _isLoggedIn = true;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        notifyListeners();
        if (kDebugMode) {
          print('User signed up successfully!');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('Email already in use.');
        }
      } else if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('Password is too weak.');
        }
      } else {
        if (kDebugMode) {
          print('An error occurred: $e');
        }
      }
    }
  }

  Future<void> logIn(
      String email, String password, BuildContext context) async {
    if (!EmailValidator.validate(email)) {
      if (kDebugMode) {
        print('Invalid email format');
      }
    }
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        _isLoggedIn = true;
        notifyListeners();
        if (kDebugMode) {
          print('User logged in successfully!');
        }
      }
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const BottomNavigationBarScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const PasswordRestedDialog();
            });
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    _isLoggedIn = false;

    notifyListeners();
  }

  Future<void> forgetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
    notifyListeners();
  }

  postDetailsToFirestore(String name, String image, String catagory) async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = name;
    userModel.image = image;
    userModel.catagory = catagory;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    notifyListeners();
  }

  Future<void> loadUsersFromFirestore() async {
    final userItemsRef = FirebaseFirestore.instance.collection('users');
    userItemsRef.snapshots().listen((userItemsSnapshot) {
      final userItemsData = userItemsSnapshot.docs;
      final List<UserModel> loadeduserItems = [];
      for (var doc in userItemsData) {
        loadeduserItems.add(UserModel.fromJson(doc.data()));
      }
      users = loadeduserItems;

      notifyListeners();

      if (kDebugMode) {
        print('Loaded ${users.length} artist itesssms from Firestore');
      }
    });
  }
}
