import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import '../Widgets/Login/bg.dart';
import '../Widgets/Login/login_card.dart';
import '../Widgets/Login/logobox.dart';
import '../Widgets/Login/register_card.dart';
import '../Widgets/common/custom_text.dart';
import '../utils/screensize.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool isRegister = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const LoginBackground(),
        logoBox(),
        registerRedirect(),
        Align(
          alignment: const Alignment(0, 0.2),
          child: SizedBox(
            width: ScreenSize.width * 0.9,
            child: FlipCard(
              key: cardKey,
              flipOnTouch: false,
              front: const LoginCard(),
              back: const RegisterCard(),
            ),
          ),
        ),
      ],
    ));
  }

  Widget registerRedirect() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: ScreenSize.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
                text: !isRegister
                    ? "Don't you have an account? "
                    : "Already have an account? "),
            InkWell(
              onTap: () {
                cardKey.currentState!.toggleCard();
                isRegister = !isRegister;
                setState(() {});
              },
              child: CustomText(
                text: !isRegister ? "Register here" : "Login",
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
