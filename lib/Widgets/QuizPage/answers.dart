import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Constants/colors.dart';
import 'package:quiz_app/Models/screensize.dart';
import 'package:quiz_app/Providers/rad_btn.dart';
import 'package:quiz_app/Widgets/common/custom_text.dart';

class Answers extends StatelessWidget {
  final List<String> answers;
  const Answers({Key? key, required this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RadBtn>(
      builder: (context, rad, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          color: kWhite,
          width: ScreenSize.width,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: answers.length,
            itemBuilder: (BuildContext context, int index) {
              return RadioListTile(
                value: index,
                groupValue: rad.answerIndex,
                onChanged: (val) {
                  rad.onChange(val, context);
                  rad.marking();
                },
                title: CustomText(
                  text: answers[index],
                  fontSize: 20,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
