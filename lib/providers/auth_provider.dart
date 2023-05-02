import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shaghaf/screens/main_screens/bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/dialogs/password_reseted_dialog.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Stream<User?> get authStateChanges {
    return _auth.authStateChanges();
  }

  Future<void> signUp(String email, String password) async {
    if (!EmailValidator.validate(email)) {
      if (kDebugMode) {
        print('Invalid email format');
      }
    }
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
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
          print('email already in use.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
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
}
