import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/images.dart';
import 'package:quiz_app/Models/screensize.dart';

Align logoBox() {
  return Align(
    alignment: Alignment.topCenter,
    child: SizedBox(
      height: ScreenSize.height! * 0.22,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: ScreenSize.width! * 0.26,
            child: Image.asset(logo),
          ),
        ],
      ),
    ),
  );
}
