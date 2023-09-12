import 'package:elephan/src/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/text_string.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(130)),
            Lottie.asset('assets/images/image_onboarding3.json',
                width: SizeConfig.screenHeight * 0.3),
            // SizedBox(height: getProportionateScreenHeight(30)),
            const Text(
              TOnBoardingTitle3,
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            const Text(
              TOnBoardingSubTitle1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
