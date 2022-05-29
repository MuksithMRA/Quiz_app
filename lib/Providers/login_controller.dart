import 'package:flutter/cupertino.dart';
import 'package:quiz_app/Services/authentication.dart';

import '../Routers/route_names.dart';

class LoginController extends ChangeNotifier {
  String _email = "";
  String _password = "";
  bool isLoading = false;

  setEmail(String val) {
    _email = val;
    notifyListeners();
  }

  setPassword(String val) {
    _password = val;
    notifyListeners();
  }

  void onLogin(BuildContext context) async {
    if (_email == "" && _password == "") {
      debugPrint("Enter valid Credentials");
    } else {
      isLoading = true;
      notifyListeners();
      String? result = await AuthService()
          .signInWithEmailAndPassword(email: _email, password: _password);
      if (result == null) {
        debugPrint("Login Failed");
        _email = "";
        _password = "";
        isLoading = false;
        notifyListeners();
      } else {
        Navigator.pushNamed(context, home);
        isLoading = false;
        _email = "";
        _password = "";
        notifyListeners();
      }
    }
  }
}
