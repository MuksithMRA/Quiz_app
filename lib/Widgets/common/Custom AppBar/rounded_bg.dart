import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../utils/screensize.dart';

class RoundedBg extends StatelessWidget {
  const RoundedBg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
      child: Container(
        height: ScreenSize.height * 0.17,
        color: primaryColor,
      ),
    );
  }
}
