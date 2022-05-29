import 'package:flutter/material.dart';
import 'package:quiz_app/Database/database.dart';

import 'package:quiz_app/Widgets/ProfileScreen/ScoreList/score_list_tile.dart';

class ScoreList extends StatelessWidget {
  const ScoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: Database.scoreList.length,
      itemBuilder: (BuildContext context, int index) {
        var tileItem = Database.scoreList[index];
        return ScoreListTile(
          img: tileItem.leadingImg,
          mark: tileItem.mark.toString(),
          testName: tileItem.title,
        );
      },
    );
  }
}
