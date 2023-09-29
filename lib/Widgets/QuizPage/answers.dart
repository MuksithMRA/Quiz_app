import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../providers/test_provider.dart';
import '../../utils/screensize.dart';
import '../common/custom_text.dart';

class Answers extends StatelessWidget {
  final List<String> answers;
  const Answers({Key? key, required this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TestProvider>(
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
