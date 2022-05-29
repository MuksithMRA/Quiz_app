import 'package:flutter/material.dart';
import 'package:quiz_app/Models/screensize.dart';
import 'icon_bar.dart';
import 'rounded_bg.dart';
import 'rounded_heading.dart';

PreferredSize customAppBar({required String title, required leadingIcon}) {
  return PreferredSize(
      child: Stack(
        children: [
          //background curve
          const RoundedBg(),
          //heading
          RoundedHeading(
            title: title,
          ),
          IconBar(
            leadingIcon: leadingIcon,
          ),
        ],
      ),
      preferredSize: Size.fromHeight(ScreenSize.height! * 0.2));
}
