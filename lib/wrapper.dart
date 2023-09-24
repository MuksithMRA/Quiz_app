import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Models/screensize.dart';
import 'package:quiz_app/Providers/auth_state.dart';
import 'package:quiz_app/Screens/Home/home.dart';
import 'Screens/Login/login.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ScreenSize.getScreenSize(h: height, w: width);
    //return const Login();
    final authState = Provider.of<AuthState>(context, listen: true);

    authState.onStateChange();

    return authState.isLoggedIn ? const Home() : const Login();
  }
}
