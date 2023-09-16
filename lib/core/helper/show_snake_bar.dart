import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

abstract class SnakeBar {
  static void showSnakeBar({required String title, required String message}) {
    Get.snackbar(
      title,
      "",
      backgroundColor: Colors.green,
      colorText: Colors.white,
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      isDismissible: true,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.only(
        bottom: 16,
        left: 5,
        right: 5,
      ),
    );
  }
}
