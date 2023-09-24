import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../Routers/route_names.dart';

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

  setEmail(String val) {
    email = val;
    notifyListeners();
  }

  setPassword(String val) {
    password = val;
    notifyListeners();
  }

  void onLogin(BuildContext context) async {
    // if (_email == "" && _password == "") {
    //   debugPrint("Enter valid Credentials");
    // } else {
    //   isLoading = true;
    //   notifyListeners();
    //   String? result = await AuthService()
    //       .signInWithEmailAndPassword(email: _email, password: _password);
    //   if (result == null) {
    //     debugPrint("Login Failed");
    //     _email = "";
    //     _password = "";
    //     isLoading = false;
    //     notifyListeners();
    //   } else {
    //     Navigator.pushNamed(context, home);
    //     isLoading = false;
    //     _email = "";
    //     _password = "";
    //     notifyListeners();
    //   }
    // }
    Navigator.pushNamed(context, home);
  }
}
