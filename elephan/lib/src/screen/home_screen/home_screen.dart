import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
            Text('Page 1'),
            Text('Page 2'),
            Text('Page 3'),
            Text('Page 4'),
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
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
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
                  icon: CupertinoIcons.person,
                  text: 'Tôi',
                ),
              ],
              selectedIndex: selectedIndex,
            ),
          ),
        ),
      ),
    );
  }
}
