import 'package:flutter/material.dart';
import '../../../utils/screensize.dart';
import 'icon_bar.dart';
import 'rounded_bg.dart';
import 'rounded_heading.dart';

PreferredSize customAppBar({required String title, required leadingIcon}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(ScreenSize.height * 0.2),
      child: Stack(
        children: [
          const RoundedBg(),
          RoundedHeading(
            title: title,
          ),
          IconBar(
            leadingIcon: leadingIcon,
          ),
        ],
      ));
}
