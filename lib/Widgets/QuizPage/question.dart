import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/colors.dart';
import 'package:quiz_app/Models/screensize.dart';
import 'package:quiz_app/Widgets/common/custom_text.dart';

class Question extends StatelessWidget {
  final String quiz;
  final String quizNo;
  const Question({Key? key, required this.quiz, required this.quizNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      color: kWhite,
      width: ScreenSize.width,
      child: CustomText(
        text: quizNo + ".  " + quiz,
        fontSize: 22,
      ),
    );
  }
}
