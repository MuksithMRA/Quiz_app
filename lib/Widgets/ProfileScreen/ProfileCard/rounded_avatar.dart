import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/colors.dart';
import 'package:quiz_app/Constants/images.dart';
import 'package:quiz_app/Models/screensize.dart';

class RoundedAvatar extends StatelessWidget {
  const RoundedAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 126,
      width: ScreenSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          CircleAvatar(
            backgroundColor: kWhite,
            radius: 50,
            child: CircleAvatar(
              foregroundColor: kWhite,
              backgroundImage: AssetImage(profileAvatar),
              radius: 45,
            ),
          ),
        ],
      ),
    );
  }
}
