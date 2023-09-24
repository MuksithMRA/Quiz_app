import 'package:flutter/material.dart';
import '../Screens/authentication_screen.dart';
import '../Screens/home.dart';
import '../Screens/splash_screen.dart';
import 'route_names.dart';

Map<String, Widget Function(BuildContext)> routes = {
  splashScreen: (context) => const SplashScreen(),
  login: (context) => const AuthenticationScreen(),
  home: (context) => const Home(),
};
