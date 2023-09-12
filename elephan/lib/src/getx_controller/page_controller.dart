import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PageControllerGetX extends GetxController {
  var pageController = PageController().obs;
  var selectedIndex = 0.obs;

  void nextPage(int value) {
    selectedIndex.value = value;
    pageController.value.animateToPage(selectedIndex.value,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }
}
