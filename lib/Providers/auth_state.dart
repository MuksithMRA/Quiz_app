import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthState extends ChangeNotifier {
  bool isLoggedIn = false;

  void onStateChange() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        isLoggedIn = true;
        notifyListeners();
      }
    });
  }
}
