import 'package:flutter/material.dart';
import 'package:quiz_app/Models/screensize.dart';
import 'package:quiz_app/Routers/route_names.dart';
import 'package:quiz_app/Widgets/common/custom_text.dart';

class RegisterRedirect extends StatelessWidget {
  const RegisterRedirect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: ScreenSize.height! * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(text: "Don't you have an account? "),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, registerPage);
              },
              child: const CustomText(
                  text: "Register Now", fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
