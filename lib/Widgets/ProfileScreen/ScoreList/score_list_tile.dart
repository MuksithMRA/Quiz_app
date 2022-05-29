import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/colors.dart';
import 'package:quiz_app/Models/screensize.dart';
import 'package:quiz_app/Widgets/common/custom_text.dart';

class ScoreListTile extends StatelessWidget {
  final String testName;
  final String img;
  final String mark;
  const ScoreListTile(
      {Key? key, required this.testName, required this.img, required this.mark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.width! * 0.1, vertical: 7),
      child: ListTile(
          title: CustomText(
            text: testName,
            fontSize: 14,
          ),
          tileColor: kWhite,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(img),
          ),
          trailing: CustomText(
            text: '$mark%',
            fontSize: 17,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
