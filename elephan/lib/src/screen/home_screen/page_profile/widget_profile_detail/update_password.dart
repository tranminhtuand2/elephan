 import 'package:flutter/material.dart';

Widget updatePassword() {
  return Container(
    padding: const EdgeInsets.all(10),
    child:  const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Đổi mật khẩu", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
      ],
    ),
  );
}