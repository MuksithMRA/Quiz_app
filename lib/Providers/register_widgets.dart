import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Models/register_user.dart';
import 'package:quiz_app/Routers/route_names.dart';
import 'package:quiz_app/Screens/Home/home.dart';
import 'package:quiz_app/Services/authentication.dart';

class RegisterWidgets extends ChangeNotifier {
  int index = 0;
  bool isLoading = false;
  RegisterUser user = RegisterUser();

  void onClick(BuildContext context) {
    if (index < 3) {
      index = index + 1;
      notifyListeners();
    } else {
      // debugPrint(user.fullName);
      // debugPrint(user.email);
      // debugPrint(user.confirmPassword);
      // debugPrint(user.password);

      register(context);

      Future.delayed(const Duration(seconds: 3), () {
        index = 0;
      });
      notifyListeners();
    }
  }

  void register(BuildContext context) async {
    if (user.fullName!.isNotEmpty &&
        user.email!.isNotEmpty &&
        user.confirmPassword!.isNotEmpty &&
        user.password!.isNotEmpty &&
        user.password == user.confirmPassword) {
      isLoading = true;
      notifyListeners();

      String? result = await AuthService().registerWithEmailAndPassword(
          email: user.email.toString(),
          password: user.password.toString(),
          fullName: user.fullName.toString());

      if (result != null) {
        Navigator.pushNamed(context, home);
      } else {
        debugPrint("Register Error");
        isLoading = false;
        notifyListeners();
      }
    } else {
      debugPrint("Enter Correct Credentials");
    }
  }

  onTextChange(String text, int index) {
    switch (index) {
      case 0:
        user.fullName = text;
        notifyListeners();
        break;
      case 1:
        user.email = text;
        notifyListeners();
        break;
      case 2:
        user.password = text;
        notifyListeners();
        break;
      case 3:
        user.confirmPassword = text;
        notifyListeners();
        break;
    }
  }
}
