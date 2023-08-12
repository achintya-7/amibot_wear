import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wear/wear.dart';

import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();

    return Scaffold(
      body: Center(
        child: WatchShape(
          builder: (context, shape, child) => Obx(() {
            if (loginController.loading.value) {
              return const CupertinoActivityIndicator();
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: const InputDecoration.collapsed(hintText: 'Enter your user ID'),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: loginController.loginTextController,
                ),
                FilledButton.tonal(
                  onPressed: () async => await loginController.login(),
                  child: const Text("Confirm"),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
