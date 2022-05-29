import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/colors.dart';

import 'custom_text.dart';

SnackBar customSnackBar(
    {required Color color, required String text, required IconData icon}) {
  return SnackBar(
    duration: const Duration(milliseconds: 450),
    backgroundColor: color,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomText(
          text: text,
          color: kWhite,
        ),
        Icon(
          icon,
          color: kWhite,
        ),
      ],
    ),
  );
}
