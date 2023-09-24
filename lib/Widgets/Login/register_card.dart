import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:quiz_app/routers/route_names.dart';
import 'package:quiz_app/utils/loader_overlay.dart';
import '../../constants/colors.dart';
import '../../providers/authentication_provider.dart';
import '../../utils/screensize.dart';
import '../../utils/utility.dart';
import '../common/custom_button.dart';
import '../common/custom_text.dart';
import '../common/custom_textfield.dart';

class RegisterCard extends StatefulWidget {
  const RegisterCard({Key? key}) : super(key: key);

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AuthenticationProvider pAuth = context.read<AuthenticationProvider>();
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
              color: kblack.withOpacity(0.2),
              blurRadius: 20.0,
              offset: const Offset(0, 10),
            )
          ],
        ),
        height: ScreenSize.height * 0.6,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const CustomText(
                text: "Register",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _firstNameController,
                hintText: "First Name",
                prefixIcon: Icons.person_rounded,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "First name required !";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: _lastNameController,
                hintText: "Last Name",
                prefixIcon: Icons.person_rounded,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Last name required !";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: _emailController,
                hintText: "Email address",
                prefixIcon: Icons.mail,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email address required !";
                  } else if (!Utility.isValidEmail(value)) {
                    return "Invalid Email Address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: _passwordController,
                isPassword: true,
                hintText: "Password",
                prefixIcon: Icons.lock,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password required !";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: _confirmPasswordController,
                isPassword: true,
                hintText: "Confirm Password",
                prefixIcon: Icons.lock,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password confirmation required !";
                  } else if (_passwordController.text.trim() !=
                      _confirmPasswordController.text.trim()) {
                    return "Passwords should be match";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                height: ScreenSize.height * 0.06,
                minWidth: ScreenSize.width * 0.45,
                text: "Register",
                ontap: () async {
                  if (_formKey.currentState!.validate()) {
                    LoadingOverlay overlay = LoadingOverlay.of(context);
                    String message = await overlay.during(
                      pAuth.onRegister(
                        UserModel(
                          email: _emailController.text.trim(),
                          firstName: _firstNameController.text.trim(),
                          lastName: _lastNameController.text.trim(),
                          password: _passwordController.text.trim(),
                        ),
                      ),
                    );
                    if (mounted) {
                      if (message.isEmpty) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, home, (route) => false);
                      } else {
                        Utility.error(context, message);
                      }
                    }
                  }
                },
                radius: 25,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
