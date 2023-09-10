import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:elephan/src/services_api/router.dart';

import '../../utils/network/dio.dart';
import '../../utils/network/response.dart';

class ProductService {
  static Future<dynamic> fetchProduct() async {
    try {
      var response = await http.get(Router.getProduct, queryParameters: {
        'lat': 12.6854297,
        'long': 108.0584348,
        'id_cg': null,
        'page': 1,
        'perpage': 0, //lấy toàn bộ
      });

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
}
