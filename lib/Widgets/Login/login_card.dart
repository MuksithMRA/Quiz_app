import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Constants/colors.dart';
import 'package:quiz_app/Models/screensize.dart';
import 'package:quiz_app/Providers/login_controller.dart';
import 'package:quiz_app/Routers/route_names.dart';
import 'package:quiz_app/Widgets/common/custom_button.dart';
import 'package:quiz_app/Widgets/common/custom_text.dart';
import 'package:quiz_app/Widgets/common/custom_textfield.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginAuth = Provider.of<LoginController>(context, listen: false);
    return Provider.of<LoginController>(context, listen: true).isLoading
        ? loadingWidget()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Material(
                  borderRadius: BorderRadius.circular(25.0),
                  color: scaffoldBackground,
                  elevation: 6,
                  shadowColor: kblack,
                  child: SizedBox(
                    height: ScreenSize.height! * 0.48,
                    width: ScreenSize.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CustomText(
                            text: "Login",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomTextField(
                            onChanged: (val) {
                              loginAuth.setEmail(val);
                            },
                            hintText: "Email Or Phone Number",
                            prefixIcon: Icons.mail,
                          ),
                          CustomTextField(
                            onChanged: (val) {
                              loginAuth.setPassword(val);
                            },
                            isPassword: true,
                            hintText: "Password",
                            prefixIcon: Icons.lock,
                          ),
                          CustomButton(
                            height: ScreenSize.height! * 0.06,
                            minWidth: ScreenSize.width! * 0.45,
                            text: "Login",
                            ontap: () {
                              loginAuth.onLogin(context);
                            },
                            radius: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
  }
}

Widget loadingWidget() {
  return Center(
    child: Material(
      borderRadius: BorderRadius.circular(30),
      color: kWhite,
      elevation: 5,
      child: SizedBox(
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
          ],
        ),
      ),
    ),
  );
}
