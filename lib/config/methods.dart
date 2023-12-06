import 'package:flutter/material.dart';
import 'package:salt_technical_test/config/theme.dart';

Size deviceSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

Widget appBarHeight(BuildContext context) {
  return SizedBox(height: AppBar().preferredSize.height);
}

void showCustomSnackbar(BuildContext context,
    {required String message, Color color = const Color(0xFF960606)}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        maxLines: null,
        style: whiteTextStyle,
      ),
    ),
  );
  return;
}

bool validate(GlobalKey<FormState> key) {
  final form = key.currentState;
  if (form!.validate()) {
    form.save();
    return true;
  } else {
    return false;
  }
}

bool checkPassword(String password, String confirmPassword) {
  if (password == confirmPassword) {
    return true;
  } else {
    return false;
  }
}
