import 'package:amibot_wear/routes/routes.dart';
import 'package:amibot_wear/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../services/storage_service.dart';

class LoginController extends GetxController {
  final loginTextController = TextEditingController();
  RxBool loading = false.obs;

  Future<void> login() async {
    if (loginTextController.text.isEmpty || loginTextController.text == "") {
      customSnackBar('Please enter a token');
      return;
    } else if (loginTextController.text.length != 4) {
      customSnackBar('Please enter a valid token');
      return;
    }

    loading.toggle();

    await loginApi();

    loading.toggle();
  }

  loginApi() async {
    int token = int.parse(loginTextController.text);

    String url = '$serverUrl/login';
    Map<String, dynamic> body = {'token': token};
    final response = await HttpService.postRequest(url, body);

    if (response.statusCode == 500) {
      customSnackBar('Internet or Server Error');
      return;
    } else if (response.statusCode == 404) {
      customSnackBar('Token not found');
      return;
    } else if (response.statusCode != 200) {
      customSnackBar('Something went wrong');
      return;
    } else {
      customSnackBar('Login Successful');
    }

    await StorageService.writeToken(token);

    Get.toNamed(HOME);
  }
}
