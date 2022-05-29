import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/colors.dart';
import 'package:quiz_app/Models/screensize.dart';
import 'package:quiz_app/Widgets/common/custom_text.dart';


class BgDetails extends StatelessWidget {
  const BgDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          color: kWhite,
          width: ScreenSize.width! * 0.8,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              profileName(),
              profileEmail(),
              const SizedBox(
                height: 8,
              ),
              const Divider(),
              Row(
                children: [
                  averageBox(),
                  rankBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget profileName() {
  return const CustomText(
    text: "John Doe",
    fontWeight: FontWeight.bold,
  );
}

Widget profileEmail() {
  return const CustomText(
    text: "johndoe@gmail.com",
    fontSize: 10,
  );
}

Widget averageBox() {
  return SizedBox(
    width: ScreenSize.width! * 0.4,
    height: 35,
    child: const Center(
      child: CustomText(
        text: "Average \n 88%",
        fontSize: 10,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget rankBox() {
  return SizedBox(
    width: ScreenSize.width! * 0.4,
    height: 35,
    child: const Center(
      child: CustomText(
        text: "Rank \n 45",
        fontSize: 10,
        textAlign: TextAlign.center,
      ),
    ),
  );
}