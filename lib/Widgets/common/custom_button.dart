import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/colors.dart';
import 'package:quiz_app/Widgets/common/custom_text.dart';

class CustomButton extends StatelessWidget {
  final double? elevation;
  final double? radius;
  final double? height;
  final double? minWidth;
  final String text;
  final Color? bgColor;
  final void Function()? ontap;
  final Color? txtColor;
  const CustomButton({
    Key? key,
    this.elevation,
    this.radius,
    this.height,
    this.minWidth,
    required this.text,
    this.ontap,
    this.bgColor,
    this.txtColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius ?? 0),
      elevation: elevation ?? 0,
      color: bgColor ?? primaryColor,
      child: MaterialButton(
          height: height,
          minWidth: minWidth,
          child: CustomText(
            text: text,
            color: txtColor ?? kWhite,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: ontap),
    );
  }
}
