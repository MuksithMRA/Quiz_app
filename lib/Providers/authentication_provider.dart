import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../services/auth_service.dart';

class AuthenticationProvider extends ChangeNotifier {
  String email = "";
  String password = "";
  bool isLoading = false;
  bool isLoggedIn = false;

  void onStateChange() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        isLoggedIn = true;
        notifyListeners();
      }
    });
  }

  Future<String> onLogin(String email, String password) async {
    String result = await AuthService.signInWithEmailAndPassword(
        email: email, password: password);
    return result;
  }
}
