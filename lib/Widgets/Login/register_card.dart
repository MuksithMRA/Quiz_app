import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/models/screensize.dart';
import 'package:quiz_app/providers/authentication_provider.dart';
import 'package:quiz_app/Widgets/common/custom_button.dart';
import 'package:quiz_app/Widgets/common/custom_text.dart';
import 'package:quiz_app/Widgets/common/custom_textfield.dart';

class RegisterCard extends StatelessWidget {
  const RegisterCard({Key? key}) : super(key: key);

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
      height: ScreenSize.height * 0.6,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            text: "Register",
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            onChanged: (val) {
              loginAuth.setEmail(val);
            },
            hintText: "First Name",
            prefixIcon: Icons.mail,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            onChanged: (val) {
              loginAuth.setEmail(val);
            },
            hintText: "Last Name",
            prefixIcon: Icons.mail,
          ),
          const SizedBox(height: 15),
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
          const SizedBox(height: 15),
          CustomTextField(
            onChanged: (val) {
              loginAuth.setPassword(val);
            },
            isPassword: true,
            hintText: "Confirm Password",
            prefixIcon: Icons.lock,
          ),
          const SizedBox(height: 20),
          CustomButton(
            height: ScreenSize.height * 0.06,
            minWidth: ScreenSize.width * 0.45,
            text: "Register",
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
