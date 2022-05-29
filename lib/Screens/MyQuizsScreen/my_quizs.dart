import 'package:flutter/material.dart';
import 'package:quiz_app/Database/database.dart';
import 'package:quiz_app/Models/test_tile.dart';

import 'package:quiz_app/Screens/HomeScreen/homescreen.dart';
import 'package:quiz_app/Widgets/common/custom_text.dart';

class MyQuizs extends StatelessWidget {
  const MyQuizs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TestTile> _doneTileItems = Database.testTileData
        .where((element) => element.isDone == true)
        .toList();

    return ListView.builder(
      itemCount: _doneTileItems.length,
      itemBuilder: (BuildContext context, int index) {
        var tileItem = _doneTileItems[index];

        if (_doneTileItems.isNotEmpty) {
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
