import 'package:flutter/cupertino.dart';

class ScreenSize {
  static double height = 0;
  static double width = 0;

  static void getScreenSize(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
  }
}
