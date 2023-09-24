import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/appbar_model.dart';
import '../Widgets/common/Custom AppBar/custom_appbar.dart';
import 'homescreen.dart';
import 'my_quizs.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<AppBarModel> appbarModels = [
      AppBarModel(icon: Icons.home, title: "Home"),
      AppBarModel(icon: Icons.quiz, title: "My Tests"),
      AppBarModel(icon: Icons.person, title: "Profile"),
    ];

    List<Widget> pages = const <Widget>[
      HomeScreen(),
      MyQuizs(),
      ProfileScreen(),
    ];

    return Scaffold(
        extendBody: true,
        appBar: customAppBar(
          title: appbarModels[currentIndex].title,
          leadingIcon: appbarModels[currentIndex].icon,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: currentIndex,
          color: primaryColor,
          backgroundColor: Colors.transparent,
          items: List.generate(
            3,
            (index) => Icon(
              appbarModels[index].icon,
              size: 30,
              color: kWhite,
            ),
          ),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body: pages[currentIndex]);
  }
}
