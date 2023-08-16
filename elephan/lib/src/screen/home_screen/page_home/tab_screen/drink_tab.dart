import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrinkTab extends StatefulWidget {
  const DrinkTab({super.key});

  @override
  State<DrinkTab> createState() => _DrinkTabState();
}

class _DrinkTabState extends State<DrinkTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(CupertinoIcons.back),
      )),
      body: const Center(
        child: Text('DrinkTab'),
      ),
    );
  }
}
