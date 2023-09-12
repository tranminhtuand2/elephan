import 'package:dio/dio.dart';
import 'package:elephan/src/components/snack_bar_getx.dart';
import 'package:elephan/src/screen/signin_signup/pagedangnhap/sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/route_manager.dart';

import '../../constants/shared_preferences.dart';
import '../../models/login_result.dart';

class Http {
  late Dio dio;
  late String token;
  late String refreshToken;

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
            // print('accessToken ${loginResult.accessToken}');
            token = loginResult.accessToken ?? '';
            options.headers['Authorization'] = 'Bearer $token';
          }
          options.headers['Access-Control-Allow-Origin'] = '*';
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          if (e.response?.statusCode == 401 &&
              e.response?.data['status'] == 'Unauthorized') {
            // Lỗi 401 - Unauthorized, cần gửi lại refreshToken để lấy accessToken mới
            print('Unauthorized =>>>>>>> TOKEN Hết hạn');
            //Nhận lại token mới
            String newRefeshToken = await handleRefreshToken();
            // Sau khi lấy accessToken mới, cần thiết lập lại header và gửi lại yêu cầu
            e.requestOptions.headers['Authorization'] =
                'Bearer $newRefeshToken}';

            final responseNew = await dio.fetch(e.requestOptions);
            return handler.resolve(responseNew);
          }

          // Xử lý lỗi khác nếu không phải lỗi 401
          print("LỖI REQUEST $e");
          return handler.next(e);
        },
      ),
    );
  }

  Future<dynamic> handleRefreshToken() async {
    final prefer = await SharedPreferencesService.getInstance();
    LoginResult? loginResult = await prefer.getLoginResult();
    if (loginResult != null) {
      refreshToken = loginResult.refreshToken ?? '';
      try {
        Response response = await dio.post(
          '${dotenv.env['URL_SERVER']}/user/auth/refreshtoken',
          data: {
            "refreshToken": refreshToken,
          },
        );
        if (response.statusCode == 200) {
          //set Token mới vào SharedPreferencesService
          loginResult.accessToken = response.data['data']['accessToken'];
          await prefer.setLoginResult(loginResult);

          // print("new accessToken: ${loginResult.accessToken}");
          return loginResult.accessToken ?? '';
        } else if (response.statusCode == 400) {
          //refreshToken hết hạn, yêu cầu đăng nhập lại
          showCustomSnackBar(
              title: "Lỗi",
              message: "Phiên làm việc đã hết hạn, xin đăng nhập lại!!",
              type: Type.error);
          Get.offAll(() => const LoginScreen());
        }
      } catch (error) {
        // Xử lý lỗi khi gửi refreshToken, ví dụ hiển thị thông báo hoặc đăng xuất người dùng
        print("Error refreshing token: $error");
      }
    }
  }
}

//how to use
Dio http = Http().dio;
