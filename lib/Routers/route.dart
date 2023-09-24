import 'package:flutter/material.dart';
import '../Screens/Authentication/authentication_screen.dart';
import '../Screens/Home/home.dart';
import '../Screens/Splash Screen/splash_screen.dart';
import 'route_names.dart';

Map<String, Widget Function(BuildContext)> routes = {
  splashScreen: (context) => const SplashScreen(),
  login: (context) => const AuthenticationScreen(),
  home: (context) => const Home(),
};
