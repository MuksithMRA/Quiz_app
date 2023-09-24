import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Models/screensize.dart';
import 'Providers/auth_state.dart';
import 'Screens/Authentication/authentication_screen.dart';
import 'Screens/Home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.getScreenSize(context);
    final authState = Provider.of<AuthState>(context, listen: true);
    authState.onStateChange();
    return authState.isLoggedIn ? const Home() : const AuthenticationScreen();
  }
}
