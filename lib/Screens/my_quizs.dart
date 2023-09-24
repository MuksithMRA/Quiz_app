import 'package:flutter/material.dart';
import 'package:quiz_app/database/database.dart';
import 'package:quiz_app/models/test_tile.dart';

import 'package:quiz_app/screens/homescreen.dart';
import 'package:quiz_app/Widgets/common/custom_text.dart';

class MyQuizs extends StatelessWidget {
  const MyQuizs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TestTile> doneTileItems = Database.testTileData
        .where((element) => element.isDone == true)
        .toList();

    return ListView.builder(
      itemCount: doneTileItems.length,
      itemBuilder: (BuildContext context, int index) {
        var tileItem = doneTileItems[index];

        if (doneTileItems.isNotEmpty) {
          //true
          return TestTileCard(tileItem: tileItem);
        } else {
          //false
          return const Center(
            child: CustomText(text: "No tests done yet"),
          );
        }
      },
    );
  }
}
