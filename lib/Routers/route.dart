import 'package:flutter/material.dart';
import 'package:quiz_app/Routers/route_names.dart';
import 'package:quiz_app/Screens/Home/home.dart';
import 'package:quiz_app/Screens/Login/login.dart';

import 'package:quiz_app/Screens/Register/register.dart';
import 'package:quiz_app/Screens/Splash%20Screen/splash_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  splashScreen: (context) => const SplashScreen(),
  login: (context) => const Login(),
  registerPage: (context) => const Register(),
  home: (context) => const Home(),
};
