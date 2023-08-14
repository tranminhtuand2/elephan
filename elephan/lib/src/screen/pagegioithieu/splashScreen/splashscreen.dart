import 'package:elephan/src/features/controller/gioithieu/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/image_String.dart';
import '../../../constants/size.dart';
import '../../../constants/text_string.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    SplashController.startanimation();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Obx(
                () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 1600),
                  top: SplashController.animate.value ? 0 : -30,
                  left: SplashController.animate.value
                      ? SizeConfig.screenWidth * 0.2
                      : -30,
                  child: SvgPicture.asset(
                    TSplashTopIcon,
                    // fit: BoxFit.fill,
                    width: getProportionateScreenWidth(200),
                    height: getProportionateScreenHeight(150),
                    // color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              Obx(
                () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 1600),
                  top: SizeConfig.screenWidth * 0.6,
                  left: SplashController.animate.value
                      ? SizeConfig.screenWidth / 3
                      : 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1600),
                    opacity: SplashController.animate.value ? 1 : 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TAppName,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Obx(
                () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 1600),
                  bottom: SplashController.animate.value
                      ? SizeConfig.screenHeight / 4
                      : 80,
                  left: SizeConfig.screenWidth * 0.2,
                  child: SvgPicture.asset(
                    TSplashImage,
                    // fit: BoxFit.contain,
                    width: SizeConfig.screenWidth * 0.2,
                    height: SizeConfig.screenHeight * 0.2,
                    // color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              Obx(
                () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 1600),
                  bottom: SizeConfig.screenWidth * 0.2,
                  left: SplashController.animate.value
                      ? SizeConfig.screenWidth / 8
                      : 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1600),
                    opacity: SplashController.animate.value ? 1 : 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TAppTagLine,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
