import 'package:dots_indicator/dots_indicator.dart';
import 'package:elephan/src/screen/home_screen/home_screen.dart';

import 'package:elephan/src/screen/pagegioithieu/onboarding_screen/onboarding_page1.dart';
import 'package:elephan/src/screen/pagegioithieu/onboarding_screen/onboarding_page2.dart';

import 'package:flutter/material.dart';

import 'onboarding_page3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;

  List<Widget> getPages() {
    return [
      const OnboardingPage1(),
      const OnboardingPage2(),
      const OnboardingPage3(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              children: getPages(),
              onPageChanged: (value) {
                setState(() {
                  currentIndexPage = value;
                });
              },
            ),
            Positioned(
              top: 10,
              left: 10,
              child: InkWell(
                onTap: () {
                  if (_pageController.page! < getPages().length - 1) {
                    _pageController.jumpToPage(getPages().length - 1);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(14),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 222, 222),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Bỏ qua".toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 150,
              left: 80,
              right: 80,
              child: DotsIndicator(
                dotsCount: getPages().length,
                position: currentIndexPage,
                decorator: DotsDecorator(
                  activeColor: Colors.black,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              left: 80,
              right: 80,
              child: ElevatedButton(
                onPressed: () {
                  if (_pageController.page! < getPages().length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.pushAndRemoveUntil<void>(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const HomeScreen()),
                      ModalRoute.withName('/home'),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14))),
                child: currentIndexPage < getPages().length - 1
                    ? Text('Tiếp theo'.toUpperCase())
                    : Text('Bắt đầu'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
