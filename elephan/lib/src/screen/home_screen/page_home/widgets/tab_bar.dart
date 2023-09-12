import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../tab_screen/drink_tab.dart';
import '../tab_screen/food_tab.dart';
import '../tab_screen/other_tab.dart';

Row tabBar() {
  return Row(
    children: [
      ItemTabFood(
        icon: const Icon(Icons.usb_rounded),
        name: 'Đồ ăn',
        function: () {
          Get.to(() => const FoodTab());
        },
      ),
      const SizedBox(width: 10),
      ItemTabFood(
        icon: const Icon(Icons.access_time),
        name: 'Đồ uống',
        function: () {
          Get.to(() => const DrinkTab());
        },
      ),
      const SizedBox(width: 10),
      ItemTabFood(
        icon: const Icon(Icons.access_time),
        name: 'Đồ uống',
        function: () {
          Get.to(() => const DrinkTab());
        },
      ),
      const SizedBox(width: 10),
      ItemTabFood(
        icon: const Icon(Icons.group_work_rounded),
        name: 'Khác',
        function: () {
          Get.to(() => const OtherTab());
        },
      ),
    ],
  );
}

class ItemTabFood extends StatelessWidget {
  ItemTabFood(
      {super.key, required this.icon, required this.name, this.function});
  Icon icon;
  String name;
  Function? function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function?.call(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 224, 224, 224),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 4),
            Text(name),
          ],
        ),
      ),
    );
  }
}
