import 'package:flutter/material.dart';
import 'package:scholar_chat/shared/custom_text.dart';

void showSnackBar(
  context,{
  required String message,
  Color? textColor,
  Alignment? alignment,
  Color? colorSnackBar,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: colorSnackBar,
      content: CustomText(
        textFont: message,
        textSize: 15,
        textColor: textColor,
        alignment: alignment ?? Alignment.center,
      )));
}
