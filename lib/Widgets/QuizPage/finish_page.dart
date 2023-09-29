import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/images.dart';
import '../../providers/test_provider.dart';
import '../../utils/screensize.dart';
import '../common/custom_button.dart';
import '../common/custom_text.dart';

class FinishPage extends StatelessWidget {
  const FinishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int mark = 50;

    return Consumer<TestProvider>(
      builder: (context, rad, child) {
        return SizedBox(
          height: ScreenSize.height,
          width: ScreenSize.width,
          child: Column(
            children: [
              Image.asset(winnerImg),
              const SizedBox(
                height: 50,
              ),
              const CustomText(
                text: "Congratulation !",
                fontSize: 20,
              ),
              const CustomText(
                text: "You did it well",
                fontSize: 17,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomText(
                text: "Your Mark is $mark",
                fontSize: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "Redo",
                minWidth: ScreenSize.width * 0.5,
                height: 50,
                radius: 15,
                ontap: () {
                  rad.onBack();
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
