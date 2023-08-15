import 'package:elephan/src/constants/size.dart';
import 'package:elephan/src/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(80)),
            Lottie.asset('assets/images/image_onboarding1.json',
                height: SizeConfig.screenHeight * 0.3),
            SizedBox(height: getProportionateScreenHeight(20)),
            Text(
              TOnBoardingTitle1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
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
