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
            const SizedBox(height: 80),
            Lottie.asset('assets/images/image_onboarding1.json'),
            const SizedBox(height: 30),
            const Text(
              'Tiện lợi',
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            const Text(
              'và',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Nhanh chóng',
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
