import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/test_model.dart';
import '../constants/colors.dart';
import '../providers/quiz_provider.dart';
import '../Routers/route_names.dart';
import '../Widgets/QuizPage/answers.dart';
import '../Widgets/QuizPage/finish_page.dart';
import '../Widgets/QuizPage/question.dart';
import '../Widgets/common/custom_text.dart';
import '../utils/screensize.dart';

class QuizPage extends StatelessWidget {
  final TestModel tileItem;
  const QuizPage({Key? key, required this.tileItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //provider Object
    final quizData = Provider.of<QuizProvider>(context, listen: true);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, home);
        Timer(const Duration(milliseconds: 200), () {
          quizData.onBack();
        });

        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: CustomText(text: tileItem.testName, color: kWhite),
          centerTitle: true,
        ),
        body: quizData.isFinish()
            ? const FinishPage()
            : Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.05),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Question(
                      quiz: tileItem.quizList[quizData.quizIndex].quiz,
                      quizNo: (quizData.quizIndex + 1).toString(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Answers(
                      answers: tileItem.quizList[quizData.quizIndex].answers
                          .map((e) => e.answer)
                          .toList(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

Widget customFloating({required void Function()? ontap}) {
  return FloatingActionButton.extended(
    onPressed: ontap,
    label: const Icon(
      Icons.arrow_forward,
    ),
    icon: const CustomText(
      text: "Next",
      color: kWhite,
    ),
  );
}
