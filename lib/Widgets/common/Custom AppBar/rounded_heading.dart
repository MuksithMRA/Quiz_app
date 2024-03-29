import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../utils/screensize.dart';
import '../custom_text.dart';

class RoundedHeading extends StatelessWidget {
  final String title;
  const RoundedHeading({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.height * 0.2,
      width: ScreenSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: primaryColor)),
            width: ScreenSize.width * 0.45,
            height: ScreenSize.height * 0.08,
            child: Center(
              child: CustomText(
                text: title,
                color: primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
