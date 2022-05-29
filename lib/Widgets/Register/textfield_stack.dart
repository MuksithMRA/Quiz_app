import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Models/register_user.dart';
import 'package:quiz_app/Models/screensize.dart';
import 'package:quiz_app/Providers/register_widgets.dart';
import 'package:quiz_app/Widgets/common/custom_textfield.dart';

class TextFieldStack extends StatefulWidget {
  const TextFieldStack({Key? key}) : super(key: key);

  @override
  State<TextFieldStack> createState() => _TextFieldStackState();
}

class _TextFieldStackState extends State<TextFieldStack> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<RegisterWidgets>(context, listen: true);
    return SizedBox(
      height: ScreenSize.height! * 0.6,
      //color: kblack,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
              height: ScreenSize.height! * 0.2,
              // color: Colors.red,
              child: IndexedStack(
                index: data.index,
                alignment: AlignmentDirectional.center,
                children: [
                  //0
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.width! * 0.1),
                    child: CustomTextField(
                      onChanged: (String val) {
                        data.onTextChange(val.toString(), data.index);
                      },
                      prefixIcon: Icons.person,
                      hintText: "Full Name",
                    ),
                  ),

                  //1
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.width! * 0.1),
                    child: CustomTextField(
                      onChanged: (String val) {
                        data.onTextChange(val.toString(), data.index);
                      },
                      hintText: "Email Address",
                      prefixIcon: Icons.mail,
                    ),
                  ),

                  //2
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.width! * 0.1),
                    child: CustomTextField(
                      onChanged: (String val) {
                        data.onTextChange(val.toString(), data.index);
                      },
                      isPassword: true,
                      hintText: "Create Password",
                      prefixIcon: Icons.lock_open,
                    ),
                  ),

                  //3
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.width! * 0.1),
                    child: CustomTextField(
                      onChanged: (String val) {
                        data.onTextChange(val.toString(), data.index);
                      },
                      isPassword: true,
                      hintText: "Confirm Password",
                      prefixIcon: Icons.lock,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
