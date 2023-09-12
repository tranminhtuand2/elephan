// import 'package:app_grocy/src/features/authentication/screen/wellcome_screen/wellcome_screen.dart';
import 'package:elephan/src/screen/signin_signup/pagedangnhap/sign_in.dart';
import 'package:get/get.dart';

import '../constants/shared_preferences.dart';
import '../screen/pagegioithieu/onboarding_screen/onboarding_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();
  RxBool animate = false.obs;
  Future startAnimation() async {
    final sharedPre = await SharedPreferencesService.getInstance();
    await Future.delayed(const Duration(milliseconds: 200));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    //kiểm tra nếu người dùng lần đầu install app thì vào onboarding ngược lại vào login
    if (sharedPre.getIsFirstInstall()) {
      sharedPre.setIsFirstInstall(false);
      Get.offAll(() => const OnboardingScreen());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }
}
