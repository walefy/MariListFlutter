import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  bool _userIsAuthenticated = false;

  AuthRepository() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  bool get userIsAuthenticated => _userIsAuthenticated;
  User? get user => _user;

  Future<void> _onAuthStateChanged(User? user) async {
    _user = user;
    _userIsAuthenticated = user != null;
    notifyListeners();
  }

  void showAlert(String title, String message) {
    // print('show temporary error');
  }

  Future<void> loginWithGoogle() async {
    try {
      const String clientId =
          String.fromEnvironment('CLIENT_ID', defaultValue: '');
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(clientId: clientId).signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
    } catch (e) {
      print('error');
      print(e);
    }
  }
}
