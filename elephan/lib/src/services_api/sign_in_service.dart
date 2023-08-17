import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SignInService {
  static Future<Map<String, dynamic>> loginrUser(
      String phone, String password) async {
    try {
      var response = await http.post(
        Uri.parse('${dotenv.env["URL_SERVER"]}/auth/login'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {"phone": phone, "password": password},
        ),
      );
      if (response.statusCode == 200) {
        print(json.decode(response.body));

        return json.decode(response.body);
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
