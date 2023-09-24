import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../utils/screensize.dart';
import '../common/custom_text.dart';

class Question extends StatelessWidget {
  final String quiz;
  final String quizNo;
  const Question({Key? key, required this.quiz, required this.quizNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      color: kWhite,
      width: ScreenSize.width,
      child: CustomText(
        text: "$quizNo.  $quiz",
        fontSize: 22,
      ),
    );
  }
}
