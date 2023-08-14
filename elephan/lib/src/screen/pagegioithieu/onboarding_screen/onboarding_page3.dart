import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Lottie.asset('assets/images/image_onboarding3.json'),
            const SizedBox(height: 50),
            const Text(
              'Tiết kiệm chi phí',
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              'Giúp người dùng mua sắm dễ dàng và nhanh chóng ngay tại ngón tay.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
