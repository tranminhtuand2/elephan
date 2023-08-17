import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpService {
  static Future<dynamic> checkPhoneNumber(String phone) async {
    try {
      var response = await http.post(
        Uri.parse('${dotenv.env["URL_SERVER"]}/auth/checkphone'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {"phone": phone},
        ),
      );

      final jsonResponse = json.decode(response.body);
      // log(jsonResponse['msg']);
      if (jsonResponse['status'] == "Ok") {
        return true;
      } else if (jsonResponse['status'] == "Conflict") {
        Get.snackbar(
            'Thông Báo', 'Số điện thoại đã được đăng kí, xin hãy đăng nhập');
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> registerUser(String phone, String password) async {
    try {
      var response = await http.post(
        Uri.parse('${dotenv.env["URL_SERVER"]}/auth/register'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {"phone": phone, "password": password},
        ),
      );

      final jsonResponse = json.decode(response.body);
      // log(jsonResponse['msg']);
      if (jsonResponse['status'] == "Created") {
        return true;
      } else if (jsonResponse['status'] == "Conflict") {
        Get.snackbar(
            'Thông Báo', 'Số điện thoại đã được đăng kí, xin hãy đăng nhập');
        return false;
      }
    } catch (e) {
      print(e);
    }
  }
}
