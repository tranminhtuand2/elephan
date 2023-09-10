import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:elephan/src/services_api/router.dart';

import '../../utils/network/dio.dart';
import '../../utils/network/response.dart';

class AuthService {
  static Future<dynamic> checkPhoneNumber(String phone) async {
    try {
      var response = await http.post(
        Router.checkPhone,
        data: {"phone": phone},
      );

      if (response.statusCode == 200) {
        log('CALL SUCCESS');
        return Success(response: response, statusCode: response.statusCode);
      } else if (response.statusCode == 409) {
        log('CALL FAIL');
        return Failure(response: response, statusCode: response.statusCode);
      }
    } on DioException catch (err) {
      log("CALL ERROR  $err");
      return Failure(response: err.response);
    }
  }

  static Future<dynamic> registerUser({
    required String? phone,
    required String? email,
    required String? password,
  }) async {
    try {
      print(phone);
      print(email);
      print(password);
      var response = await http.post(
        Router.register,
        data: {
          'email': email,
          "phone": phone,
          "password": password,
        },
      );
      if (response.statusCode == 201) {
        log('CALL SUCCESS');
        return Success(response: response, statusCode: response.statusCode);
      } else if (response.statusCode == 409) {
        log('CALL FAIL');
        return Failure(response: response, statusCode: response.statusCode);
      }
    } on DioException catch (err) {
      log("CALL ERROR  $err");
      return Failure(response: err.response);
    }
  }

  static Future<dynamic> loginUser({
    String? phone,
    String? email,
    required String? password,
  }) async {
    try {
      var response = await http.post(Router.login,
          data: phone != null
              ? {
                  "phone": phone,
                  "password": password,
                }
              : {
                  'email': email,
                  "password": password,
                });
      if (response.statusCode == 200) {
        log('CALL SUCCESS');
        return Success(response: response, statusCode: response.statusCode);
      } else if (response.statusCode == 400) {
        log('CALL FAIL');
        return Failure(response: response, statusCode: response.statusCode);
      }
    } on DioException catch (err) {
      log("CALL ERROR  $err");
      return Failure(response: err.response);
    }
  }

  static Future<dynamic> activeCodeEmail({
    required int? code,
    required String? email,
  }) async {
    try {
      var response = await http.post(
        Router.activeCodeEmail,
        data: {
          'email': email,
          "code": code,
        },
      );
      if (response.statusCode == 200) {
        log('CALL SUCCESS');
        return Success(response: response, statusCode: response.statusCode);
      } else if (response.statusCode == 400) {
        log('CALL FAIL');
        return Failure(response: response, statusCode: response.statusCode);
      }
    } on DioException catch (err) {
      log("CALL ERROR  $err");
      return Failure(response: err.response);
    }
  }
}
