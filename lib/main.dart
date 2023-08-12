import 'package:amibot_wear/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final login = await checkLogin();
  runApp(MyApp(login: login));
}

Future<bool> checkLogin() async {
  final token = await StorageService.readToken();
  if (token != null) {
    return true;
  }
  return false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.login});

  final bool login;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: getPages,
      initialRoute: login ? HOME : LOGIN,
    );
  }
}
