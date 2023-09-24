import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/common_provider.dart';

import '../../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String hintText;
  final bool? isPassword;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const CustomTextField({
    Key? key,
    required this.prefixIcon,
    required this.hintText,
    this.isPassword,
    this.controller,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passwordVisibility =
        Provider.of<CommonProvider>(context, listen: true);
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        onChanged: onChanged,
        controller: controller,
        obscureText: passwordVisibility.changeObsecure(isPassword: isPassword),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon(
            isPassword: isPassword,
            passwordVisibility: passwordVisibility,
          ),
          filled: true,
          fillColor: kWhite,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(28),
          ),
        ));
  }
}

Widget suffixIcon(
    {required bool? isPassword, required dynamic passwordVisibility}) {
  if (isPassword != null) {
    return IconButton(
      splashRadius: 1,
      onPressed: () {
        passwordVisibility.changeState();
      },
      icon: Icon(passwordVisibility.isShowing
          ? Icons.visibility
          : Icons.visibility_off),
    );
  } else {
    return const SizedBox();
  }
}
