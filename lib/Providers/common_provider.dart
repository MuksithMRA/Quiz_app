import 'package:flutter/cupertino.dart';

class CommonProvider extends ChangeNotifier {
  bool isShowing = false;

  void changeState() {
    isShowing = !isShowing;
    notifyListeners();
  }

  bool changeObsecure({bool? isPassword}) {
    if (isPassword == null) {
      return false;
    } else {
      return !isShowing;
    }
  }
}
