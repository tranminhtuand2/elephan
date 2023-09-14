import 'package:flutter/material.dart';

InkWell updatePassword() {
  return InkWell(
    onTap: () {},
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4)),
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: const Center(
          child: Text(
            "Đổi mật khẩu",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}
