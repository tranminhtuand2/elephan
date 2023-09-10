import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../constants/shared_preferences.dart';
import '../../models/login_result.dart';

class Http {
  late Dio dio;

  late String token;
  Http() {
    dio = Dio(BaseOptions(
        baseUrl: dotenv.env['URL_SERVER'] ?? "http://localhost:1234",
        headers: {'Content-Type': 'application/json'},
        connectTimeout: const Duration(seconds: 10)));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          final prefer = await SharedPreferencesService.getInstance();
          LoginResult? loginResult = await prefer.getLoginResult();
          if (loginResult != null) {
            print('accessToken ${loginResult.accessToken}');
            token = loginResult.accessToken ?? '';
            options.headers['Authorization'] = 'Bearer $token';
          }
          options.headers['Access-Control-Allow-Origin'] = '*';
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // Do something with response data.
          // If you want to reject the request with a error message,
          // you can reject a `DioException` object using `handler.reject(dioError)`.
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          // Do something with response error.
          // If you want to resolve the request with some custom data,
          // you can resolve a `Response` object using `handler.resolve(response)`.
          print("LỖI REQUEST $e");
          return handler.next(e);
        },
      ),
    );
  }

  // Object handleRefreshToken() async {
  //   Response response = Response(requestOptions: RequestOptions());
  //   try {
  //     response = await dio.post('/url-refreshToken', data: {token: token});
  //     return response.statusCode == 200 || response.statusCode == 201
  //         ? Success(response: response, statusCode: response.statusCode)
  //         : Failure(response: response, statusCode: response.statusCode);
  //   } catch (err) {
  //     return Failure(response: response);
  //   }
  // }
}

//how to use
Dio http = Http().dio;
