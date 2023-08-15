import 'package:flutter/material.dart';
import 'package:get/get.dart';

String serverUrl = "https://py-amibot.fly.dev";
String localUrl = "http://10.0.2.2:3333";

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
