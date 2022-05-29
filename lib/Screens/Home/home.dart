import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/colors.dart';
import 'package:quiz_app/Models/appbar_model.dart';
import 'package:quiz_app/Screens/HomeScreen/homescreen.dart';
import 'package:quiz_app/Screens/MyQuizsScreen/my_quizs.dart';
import 'package:quiz_app/Screens/ProfileScreen/profile.dart';
import 'package:quiz_app/Widgets/common/Custom%20AppBar/custom_appbar.dart';

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
