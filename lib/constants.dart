import 'package:flutter/material.dart';
import 'package:get/get.dart';

String emulatorLocalhost = "http://10.0.2.2:8000";

customSnackBar(String message) {
  Get.snackbar(
    '',
    '',
    duration: const Duration(seconds: 1),
    titleText: Text(
      message,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
    snackPosition: SnackPosition.BOTTOM,
  );
}
