import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodTab extends StatefulWidget {
  const FoodTab({super.key});

  @override
  State<FoodTab> createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(CupertinoIcons.back),
      )),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.amber,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 50,
          itemBuilder: (context, index) {
            return Text('FoodTab $index');
          },
        ),
      ),
    );
  }
}
