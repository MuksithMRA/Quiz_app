import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Widgets/Login/bg.dart';
import 'package:quiz_app/Widgets/Login/login_card.dart';
import 'package:quiz_app/Widgets/Login/logobox.dart';
import 'package:quiz_app/Widgets/Login/register_redirect.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const LoginBackground(),
        logoBox(),
        const RegisterRedirect(),
        const LoginCard(),
      ],
    ));
  }
}







