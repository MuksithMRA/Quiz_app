import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../utils/screensize.dart';
import '../common/custom_button.dart';
import '../common/custom_text.dart';
import '../common/custom_textfield.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: scaffoldBackground,
          boxShadow: [
            BoxShadow(
              color: kblack.withOpacity(0.1),
              blurRadius: 20.0,
              offset: const Offset(0, 10),
            )
          ],
        ),
        height: ScreenSize.height * 0.48,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              text: "Login",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _emailController,
              hintText: "Email address",
              prefixIcon: Icons.mail,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: _passwordController,
              isPassword: true,
              hintText: "Password",
              prefixIcon: Icons.lock,
            ),
            const SizedBox(height: 20),
            CustomButton(
              height: ScreenSize.height * 0.06,
              minWidth: ScreenSize.width * 0.45,
              text: "Login",
              ontap: () async {},
              radius: 25,
            ),
          ],
        ),
      ),
    );
  }
}
