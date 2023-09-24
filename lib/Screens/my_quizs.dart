import 'package:flutter/material.dart';

import '../Widgets/common/custom_text.dart';
import '../database/database.dart';
import '../models/test_tile.dart';
import 'home_screen.dart';

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
