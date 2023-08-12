import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class HttpService {
  static Future<Response> postRequest(String url, Map<String, dynamic> body) async {
    try {
      final Uri uri = Uri.parse(url);
      final String jsonString = json.encode(body);
      final Map<String, String> headers = {'Content-Type': 'application/json'};

      final response = await post(uri, body: jsonString, headers: headers);
      return response;
    } on Exception catch (e) {
      log(e.toString());
      return Response('', 500);
    }
  }
}
