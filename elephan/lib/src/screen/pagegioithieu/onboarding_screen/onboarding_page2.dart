import 'package:elephan/src/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/text_string.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(80)),
            Lottie.asset('assets/images/image_onboarding2.json',
                height: SizeConfig.screenHeight * 0.3),
            SizedBox(height: getProportionateScreenHeight(50)),
            const Text(
              TOnBoardingTitle2,
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              TOnBoardingSubTitle2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
