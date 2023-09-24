import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../utils/screensize.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: ScreenSize.height * 0.5,
        color: primaryColor,
      ),
    );
  }
}
