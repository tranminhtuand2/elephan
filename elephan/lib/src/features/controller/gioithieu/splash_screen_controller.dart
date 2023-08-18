// import 'package:app_grocy/src/features/authentication/screen/wellcome_screen/wellcome_screen.dart';
import 'package:get/get.dart';

import '../../../screen/pagegioithieu/onboarding_screen/onboarding_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();
  RxBool animate = false.obs;
  Future startanimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 1500));
    Get.off(() => const OnboardingScreen());
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => WellComeScreen(),
    //     ));
  }
}
