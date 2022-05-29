import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/colors.dart';
import 'package:quiz_app/Database/database.dart';

import 'package:quiz_app/Widgets/HomeScreen/test_tile_details.dart';
import 'package:quiz_app/Widgets/HomeScreen/tile_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Database.testTileData.length,
      itemBuilder: (BuildContext context, int index) {
        var tileItem = Database.testTileData[index];
        return TestTileCard(
          tileItem: tileItem,
        );
      },
    );
  }
}










class TestTileCard extends StatelessWidget {
  final dynamic tileItem;
  const TestTileCard({Key? key, this.tileItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Material(
        elevation: 5,
        color: kWhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: SizedBox(
          child: Column(
            children: [
              //red
              TileImage(
                img: tileItem.image,
              ),
              //green
              TestTileDetails(
               tileItem: tileItem,
              )
            ],
          ),
          height: 200,
        ),
      ),
    );
  }
}
