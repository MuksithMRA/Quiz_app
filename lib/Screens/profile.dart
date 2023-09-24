import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Widgets/ProfileScreen/ScoreList/score_list.dart';
import 'package:quiz_app/Widgets/ProfileScreen/divider_heading.dart';
import 'package:quiz_app/Widgets/ProfileScreen/ProfileCard/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileCard(),
          DividerHeading(),
          ScoreList(),
        ],
      ),
    );
  }
}
