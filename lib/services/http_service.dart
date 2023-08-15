import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';

class HttpService {
  static Future<Response> postRequest(String url, Map<String, dynamic> body) async {
    try {
      final Uri uri = Uri.parse(url);
      final String jsonString = json.encode(body);
      final Map<String, String> headers = {'Content-Type': 'application/json'};

      final response = await post(uri, body: jsonString, headers: headers);
      return response;
    } on SocketException catch (e) {
      log("No Internet : $e");
      return Response('', 503);
    } on HttpException catch (e) {
      log("Server Issue : $e");
      return Response('', 500);
    } on FormatException catch (e) {
      log("Server response issue : $e");
      return Response('', 403);
    }
  }
}
