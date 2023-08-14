import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Lottie.asset('assets/images/image_onboarding2.json'),
            const SizedBox(height: 50),
            const Text(
              'Dễ dàng quản lý',
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              'Tích hợp các tính năng quản lý tiện lợi như theo dõi đơn hàng, lưu trữ thông tin thanh toán.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
