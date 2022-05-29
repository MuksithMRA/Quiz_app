import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Providers/register_widgets.dart';
import 'package:quiz_app/Widgets/Login/bg.dart';
import 'package:quiz_app/Widgets/Login/login_card.dart';
import 'package:quiz_app/Widgets/Login/logobox.dart';
import 'package:quiz_app/Widgets/Register/next_button.dart';
import 'package:quiz_app/Widgets/Register/textfield_stack.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<RegisterWidgets>(context, listen: true).isLoading
          ? loadingWidget()
          : Stack(
              children: [
                const LoginBackground(),
                logoBox(),
                const TextFieldStack(),
                const NextPageButton(),
              ],
            ),
    );
  }
}
