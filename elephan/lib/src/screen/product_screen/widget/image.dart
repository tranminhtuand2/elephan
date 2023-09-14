import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget imageProduct() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/images/food.jpg",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 5,
          left: 5,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_rounded,
              size: 50.0,
            ),
            color: Colors.white,
            onPressed: () => Get.back(),
          ),
        ),
      ],
    );
  }