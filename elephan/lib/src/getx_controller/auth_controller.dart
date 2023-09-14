import 'package:elephan/src/getx_controller/loading_controller.dart';
import 'package:elephan/src/models/login_result.dart';
import 'package:elephan/src/screen/home_screen/home_screen.dart';
import 'package:elephan/src/screen/signin_signup/pagedangky/sign_up.dart';
import 'package:elephan/src/services_api/auth/auth_service.dart';
import 'package:elephan/src/utils/network/response.dart';
import 'package:get/get.dart';

import '../components/snack_bar_getx.dart';
import '../constants/shared_preferences.dart';
import '../screen/signin_signup/pagedangnhap/sign_in.dart';
import '../screen/signin_signup/pagequenmatkhau/otp_page.dart';

class AuthController extends GetxController {
  var login_result = LoginResult().obs;
  final loadingController = Get.find<LoadingController>();

  Future<void> checkPhoneNumber({required String phone}) async {
    loadingController.showLoading();
    var response = await AuthService.checkPhoneNumber(phone);
    if (response is Success) {
      loadingController.hideLoading();

      Get.to(() => SignUpEmailPage(phoneNumber: phone));
    } else {
      loadingController.hideLoading();
      Get.to(() => PasswordLogin(phone: phone));
    }
  }

  Future<void> signUp({
    required String phone,
    required String email,
    required String password,
  }) async {
    loadingController.showLoading();
    var response = await AuthService.registerUser(
      email: email,
      phone: phone,
      password: password,
    );
    if (response is Success) {
      // print(response.response);
      loadingController.hideLoading();
      Get.to(() => ForgotPasswordOTPPage(
            valueEmail: email,
          ));
    } else {
      // print(response.response);
      loadingController.hideLoading();
      showCustomSnackBar(
          type: Type.error,
          title: 'Có lỗi!',
          message: response.response.data['msg']);
    }
  }

  Future<void> signIn({
    String? phone,
    String? email,
    required String password,
  }) async {
    loadingController.showLoading();
    var response = await AuthService.loginUser(
      email: email,
      phone: phone,
      password: password,
    );
    if (response is Success) {
      // print(response.response.data);
      loadingController.hideLoading();

      // Lưu thông tin vào Shared Preferences
      final sharedPrefs = await SharedPreferencesService.getInstance();
      LoginResult loginResult =
          LoginResult.fromMap(response.response.data['data']);
      login_result.value = loginResult;
      await sharedPrefs.setLoginResult(loginResult);

      //chuyển sang màn hình home nếu đăng nhập thành công

      Get.offAll(() => const HomeScreen());
    } else {
      print(response.response);
      loadingController.hideLoading();
      showCustomSnackBar(
          type: Type.error,
          title: 'Có lỗi!',
          message: response.response.data['msg']);
    }
  }

  Future<void> activeCodeEmail({
    required String email,
    required int code,
  }) async {
    loadingController.showLoading();
    var response = await AuthService.activeCodeEmail(
      email: email,
      code: code,
    );
    if (response is Success) {
      print(response.response);
      loadingController.hideLoading();
      showCustomSnackBar(
          type: Type.success,
          title: 'Thành công',
          message: 'Đăng ký thành công');
      Get.offAll(() => PasswordLogin(
            email: email,
          ));
    } else {
      print(response.response);
      loadingController.hideLoading();
      showCustomSnackBar(
          type: Type.error, title: 'Có lỗi!', message: "Sai OTP, xin thử lại");
    }
  }
}
