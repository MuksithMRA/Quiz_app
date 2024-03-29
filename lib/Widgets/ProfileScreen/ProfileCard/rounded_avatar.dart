import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../utils/screensize.dart';

class RoundedAvatar extends StatelessWidget {
  const RoundedAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 126,
      width: ScreenSize.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
