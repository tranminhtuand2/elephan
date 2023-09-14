// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../profile_detail.dart';

Widget avatarAndNameProfile(BuildContext context) {
  return InkWell(
    onTap: () {
      Get.to(() => const ProfileDetail());
    },
    child: const Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                  radius: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 3),
                  child: Text(
                    "Lê Hoài Nam",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            size: 34,
          )
        ],
      ),
    ),
  );
}
