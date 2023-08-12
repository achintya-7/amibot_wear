// ignore_for_file: non_constant_identifier_names

import 'package:amibot_wear/features/home/bindings/home_bindings.dart';
import 'package:amibot_wear/features/login/bindings/login_bindings.dart';
import 'package:get/get.dart';

import '../features/home/screens/home_screen.dart';
import '../features/login/screens/login_screen.dart';

String LOGIN = '/login';
String HOME = '/home';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: LOGIN,
    page: () => const LoginScreen(),
    binding: LoginBindings(),
  ),
  GetPage(
    name: HOME,
    page: () => const HomeScreen(),
    binding: HomeBindings(),
  ),
];
