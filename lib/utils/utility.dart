import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utility {
  static bool isValidEmail(String value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }

  static error(BuildContext context, String? message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(
        Icons.error,
        color: Colors.red,
      ),
      title: 'Error',
      message: message,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  static warning(BuildContext context, String? message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(
        Icons.warning,
        color: Colors.orange,
      ),
      title: 'Warning',
      message: message,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  static success(BuildContext context, String? message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(
        Icons.check,
        color: Colors.green,
      ),
      title: 'Success',
      message: message,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
