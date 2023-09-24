import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/authentication_provider.dart';
import 'screens/authentication_screen.dart';
import 'screens/home.dart';
import 'utils/screensize.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.getScreenSize(context);
    final authState =
        Provider.of<AuthenticationProvider>(context, listen: true);
    authState.onStateChange();
    return authState.isLoggedIn ? const Home() : const AuthenticationScreen();
  }
}
