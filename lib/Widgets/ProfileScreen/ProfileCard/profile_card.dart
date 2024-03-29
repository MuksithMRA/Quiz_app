import 'package:flutter/material.dart';
import 'bg_details.dart';
import 'rounded_avatar.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 220,
      child: Stack(
        children: [
          BgDetails(),
          RoundedAvatar(),
        ],
      ),
    );
  }
}
