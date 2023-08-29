import 'dart:developer';

import 'package:elephan/src/screen/home_screen/page_home/page_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../constants/shared_preferences.dart';
import '../../models/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    int selectedIndex = 0;
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: const [
            PageHome(),
            Text('Page 2'),
            Text('Page 3'),
            Text('Page 4'),
            //
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            // color: Colors.white,
            // boxShadow: [
            //   BoxShadow(
            //     blurRadius: 20,
            //     color: Colors.black.withOpacity(.1),
            //   )
            // ],
            ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              selectedIndex: selectedIndex,
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Theme.of(context).colorScheme.background,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Theme.of(context).colorScheme.onBackground,
              color: Theme.of(context).colorScheme.onBackground,
              onTabChange: (value) {
                setState(() {
                  selectedIndex = value;
                });
                controller.animateToPage(selectedIndex,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutQuad);
              },
              tabs: const [
                GButton(
                  icon: CupertinoIcons.house_alt,
                  text: 'Nhà',
                ),
                GButton(
                  icon: CupertinoIcons.search,
                  text: 'Tìm kiếm',
                ),
                GButton(
                  icon: CupertinoIcons.layers,
                  text: 'Cửa hàng',
                ),
                GButton(
                  //
                  icon: CupertinoIcons.person,
                  text: 'Tôi',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
