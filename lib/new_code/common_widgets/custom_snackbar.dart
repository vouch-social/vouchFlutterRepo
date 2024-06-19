import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackbar({
  required String title,
  required String message,
  Color colorText = Colors.black,
  Color backgroundColor = Colors.white,
  SnackPosition snackPosition = SnackPosition.TOP,
  double maxWidth = double.infinity,
  TextButton? mainButton,
  OnTap? onTap,
  Widget? titleText,
  Widget? messageText,
}) {
  Get.snackbar(
    title,
    message,
    colorText: colorText,
    backgroundColor: backgroundColor,
    snackPosition: snackPosition,
    maxWidth: maxWidth,
    mainButton: mainButton,
    onTap: onTap,
    titleText: titleText,
    messageText: messageText

  );
}