import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<int?> readToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getInt('token');
    return token;
  }

  static Future<void> writeToken(int token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('token', token);
  }

  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}
