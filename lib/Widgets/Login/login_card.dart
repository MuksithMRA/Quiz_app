import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../models/screensize.dart';
import '../../providers/authentication_provider.dart';
import '../common/custom_button.dart';
import '../common/custom_text.dart';
import '../common/custom_textfield.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginAuth =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Container(
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
            onChanged: (val) {
              loginAuth.setEmail(val);
            },
            hintText: "Email address",
            prefixIcon: Icons.mail,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            onChanged: (val) {
              loginAuth.setPassword(val);
            },
            isPassword: true,
            hintText: "Password",
            prefixIcon: Icons.lock,
          ),
          const SizedBox(height: 20),
          CustomButton(
            height: ScreenSize.height * 0.06,
            minWidth: ScreenSize.width * 0.45,
            text: "Login",
            ontap: () {
              loginAuth.onLogin(context);
            },
            radius: 25,
          ),
        ],
      ),
    );
  }
}
