import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../database/database.dart';
import '../../providers/quiz_provider.dart';
import '../../screens/quiz_page.dart';
import '../../utils/screensize.dart';
import '../common/custom_button.dart';
import '../common/custom_text.dart';

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
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.width * 0.03,
          vertical: 15,
        ),
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
    );
  }
}

class TestTileRight extends StatelessWidget {
  final dynamic tileItem;
  const TestTileRight({Key? key, this.tileItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  radius: 10,
                  txtColor: tileItem.isDone ? primaryColor : kWhite,
                  bgColor: tileItem.isDone ? kWhite : primaryColor,
                  text: tileItem.isDone ? "Redo Quiz" : "Start Quiz",
                  ontap: () {
                    Provider.of<QuizProvider>(context, listen: false)
                        .setTileIndex(Database.testTileData.indexOf(tileItem));
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return QuizPage(tileItem: tileItem);
                    }));
                  },
                ),
              ],
            ),
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
      width: ScreenSize.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
              text: tileItem.testName,
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: kWhite),
          CustomText(text: tileItem.subject, color: kWhite),
          const SizedBox(height: 10),
          CustomText(text: tileItem.author, color: kWhite)
        ],
      ),
    );
  }
}
