import 'package:elephan/src/getx_controller/page_controller.dart';
import 'package:elephan/src/screen/home_screen/page_home/page_home.dart';
import 'package:elephan/src/screen/home_screen/page_profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final pageController = PageController();
  // int selectedIndex = 0;
  final pageControllerGetX = Get.put(PageControllerGetX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageControllerGetX.pageController.value,
          // controller: pageController,
          children: const [
            PageHome(),
            Text('Page 2'),
            Text('Page 3'),
           Profile(),
            //
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: const BoxDecoration(),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                // selectedIndex: selectedIndex,
                selectedIndex: pageControllerGetX.selectedIndex.value,
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Theme.of(context).colorScheme.background,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Theme.of(context).colorScheme.onBackground,
                color: Theme.of(context).colorScheme.onBackground,
                onTabChange: (value) {
                  pageControllerGetX.nextPage(value);
                  //Nếu không sử dụng GetX thì sử dụng như dưới
                  // setState(() {
                  //   selectedIndex = value;
                  // });
                  // pageController.animateToPage(selectedIndex,
                  //     duration: const Duration(milliseconds: 400),
                  //     curve: Curves.easeOutQuad);
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
      ),
    );
  }
}
