import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Constants/colors.dart';
import 'package:quiz_app/Database/database.dart';
import 'package:quiz_app/Models/screensize.dart';
import 'package:quiz_app/Providers/rad_btn.dart';

import 'package:quiz_app/Screens/Quiz%20Page/quiz_page.dart';
import 'package:quiz_app/Widgets/common/custom_button.dart';
import 'package:quiz_app/Widgets/common/custom_text.dart';

class TestTileDetails extends StatelessWidget {
  final dynamic tileItem;
  const TestTileDetails({
    Key? key,
    this.tileItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: primaryColor.withOpacity(0.8),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.width! * 0.03),
          child: Row(
            children: [
              TestTileLeft(
                tileItem: tileItem,
              ),
              TestTileRight(
                tileItem: tileItem,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestTileRight extends StatelessWidget {
  final dynamic tileItem;
  const TestTileRight({Key? key, this.tileItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.width! * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomText(
            text: "${tileItem.quizQty} Quizs",
            color: kWhite,
          ),
          Visibility(
            visible: tileItem.isDone,
            child: CustomText(
              text: "Mark : ${tileItem.mark}%",
              color: kWhite,
            ),
          ),
          CustomButton(
            radius: 10,
            txtColor: tileItem.isDone ? primaryColor : kWhite,
            bgColor: tileItem.isDone ? kWhite : primaryColor,
            text: tileItem.isDone ? "Redo Quiz" : "Start Quiz",
            ontap: () {
              Provider.of<RadBtn>(context, listen: false)
                  .setTileIndex(Database.testTileData.indexOf(tileItem));
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return QuizPage(tileItem: tileItem);
              }));
            },
          )
        ],
      ),
    );
  }
}

class TestTileLeft extends StatelessWidget {
  final dynamic tileItem;
  const TestTileLeft({Key? key, this.tileItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.width! * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomText(
              text: tileItem.testName,
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: kWhite),
          CustomText(text: tileItem.subject, fontSize: 10, color: kWhite),
          const SizedBox(height: 10),
          CustomText(text: tileItem.author, fontSize: 10, color: kWhite)
        ],
      ),
    );
  }
}
