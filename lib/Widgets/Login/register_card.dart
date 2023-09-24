import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../utils/screensize.dart';
import '../common/custom_button.dart';
import '../common/custom_text.dart';
import '../common/custom_textfield.dart';

class RegisterCard extends StatelessWidget {
  const RegisterCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const CustomTextField(
            hintText: "First Name",
            prefixIcon: Icons.mail,
          ),
          const SizedBox(height: 15),
          const CustomTextField(
            hintText: "Last Name",
            prefixIcon: Icons.mail,
          ),
          const SizedBox(height: 15),
          const CustomTextField(
            hintText: "Email address",
            prefixIcon: Icons.mail,
          ),
          const SizedBox(height: 15),
          const CustomTextField(
            isPassword: true,
            hintText: "Password",
            prefixIcon: Icons.lock,
          ),
          const SizedBox(height: 15),
          const CustomTextField(
            isPassword: true,
            hintText: "Confirm Password",
            prefixIcon: Icons.lock,
          ),
          const SizedBox(height: 20),
          CustomButton(
            height: ScreenSize.height * 0.06,
            minWidth: ScreenSize.width * 0.45,
            text: "Register",
            ontap: () {},
            radius: 25,
          ),
        ],
      ),
    );
  }
}
