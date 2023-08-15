import 'dart:convert';

import 'package:amibot_wear/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../models/class_schedule_model.dart';
import '../../../services/http_service.dart';
import '../../../services/storage_service.dart';

class ScheduleController extends GetxController {
  Rx<List<ClassSchedule>> classSchedule = Rx<List<ClassSchedule>>([]);
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  fetch() async {
    loading.toggle();

    final token = await StorageService.readToken();
    if (token == null) {
      customSnackBar('Token not found');
      Get.offAndToNamed(LOGIN);
      return;
    }

    await fetchAPI(token);

    loading.toggle();
  }

  fetchAPI(int token) async {
    String url = '$localUrl/class_schedule';
    Map<String, dynamic> body = {'token': token};

    final response = await HttpService.postRequest(url, body);

    if (response.statusCode == 503 || response.statusCode == 500) {
      customSnackBar('Internet or Server Error');
      return;
    } else if (response.statusCode == 404) {
      customSnackBar('Token not found');
      await StorageService.removeToken();
      Get.offAndToNamed(LOGIN);
      return;
    } else if (response.statusCode == 204) {
      customSnackBar('Hooray 🎉');
      return;
    } else if (response.statusCode != 200) {
      customSnackBar('Unknown Error');
      return;
    }

    final data = jsonDecode(response.body) as List<dynamic>;

    for (final item in data) {
      classSchedule.value.add(ClassSchedule.fromJson(jsonEncode(item)));
    }
  }

  Color colourResponder(int val) {
    switch (val) {
      case 0:
        return Colors.blueGrey;

      case 1:
        return Colors.green;

      case 2:
        return Colors.red;

      default:
        return Colors.blueGrey;
    }
  }
}
