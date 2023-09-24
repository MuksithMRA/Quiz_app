import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../utils/screensize.dart';
import '../common/custom_text.dart';

class DividerHeading extends StatelessWidget {
  const DividerHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.width * 0.1, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(text: "Scores"),
          Container(
            width: 25,
            height: 2.5,
            color: primaryColor,
          )
        ],
      ),
    );
  }
}
