import 'package:elephan/src/models/login_result.dart';
import 'package:elephan/src/screen/home_screen/home_screen.dart';
import 'package:elephan/src/screen/signin_signup/pagedangky/sign_up.dart';
import 'package:elephan/src/services_api/auth/auth_service.dart';
import 'package:elephan/src/utils/network/response.dart';
import 'package:get/get.dart';

import '../constants/shared_preferences.dart';
import '../screen/signin_signup/pagedangnhap/sign_in.dart';
import '../screen/signin_signup/pagequenmatkhau/otp_page.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  Future<void> checkPhoneNumber({required String phone}) async {
    isLoading.value = true;
    var response = await AuthService.checkPhoneNumber(phone);
    if (response is Success) {
      print(response.response);
      isLoading.value = false;
      Get.to(() => SignUpEmailPage(phoneNumber: phone));
    } else {
      print(response.response);
      isLoading.value = false;

      Get.to(() => PasswordLogin(phone: phone));
    }
  }

  Future<void> signUp({
    required String phone,
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    var response = await AuthService.registerUser(
      email: email,
      phone: phone,
      password: password,
    );
    if (response is Success) {
      print(response.response);
      isLoading.value = false;
      Get.to(() => ForgotPasswordOTPPage(
            valueEmail: email,
          ));
    } else {
      print(response.response);
      isLoading.value = false;
      Get.snackbar('Lỗi', response.response.data["msg"].toString());
    }
  }

  Future<void> signIn({
    String? phone,
    String? email,
    required String password,
  }) async {
    isLoading.value = true;
    var response = await AuthService.loginUser(
      email: email,
      phone: phone,
      password: password,
    );
    if (response is Success) {
      print(response.response.data);
      isLoading.value = false;

      // Lưu thông tin vào Shared Preferences
      final sharedPrefs = await SharedPreferencesService.getInstance();
      LoginResult loginResult =
          LoginResult.fromMap(response.response.data['data']);

      await sharedPrefs.setLoginResult(loginResult);

      //chuyển sang màn hình home nếu đăng nhập thành công

      Get.offAll(() => const HomeScreen());
    } else {
      print(response.response);
      isLoading.value = false;
      Get.snackbar('Lỗi', response.response.data["msg"].toString());
    }
  }

  Future<void> activeCodeEmail({
    required String email,
    required int code,
  }) async {
    isLoading.value = true;
    var response = await AuthService.activeCodeEmail(
      email: email,
      code: code,
    );
    if (response is Success) {
      print(response.response);
      isLoading.value = false;
      Get.snackbar('Thành công', 'Đăng ký thành công');
      Get.offAll(() => PasswordLogin(
            email: email,
          ));
    } else {
      print(response.response);
      isLoading.value = false;
      Get.snackbar('Lỗi', "Sai OTP, xin thử lại");
    }
  }
}
