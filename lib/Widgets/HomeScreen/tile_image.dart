import 'package:flutter/material.dart';

class TileImage extends StatelessWidget {
  final String img;
  const TileImage({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.red,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Image.asset(img),
      ),
    );
  }
}