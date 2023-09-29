import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz_app/constants/storage_keys.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:quiz_app/services/user_service.dart';
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
    if (result.isEmpty) {
      UserModel? userModel =
          await UserService.getUser(prefs.getString(StorageKeys.uid)!);
      if (userModel != null) {
        prefs.setString(StorageKeys.user, userModel.toJson());
      }
    }
    return result;
  }

  Future<String> onRegister(UserModel userModel) async {
    String result = await AuthService.registerWithEmailAndPassword(userModel);
    return result;
  }
}
