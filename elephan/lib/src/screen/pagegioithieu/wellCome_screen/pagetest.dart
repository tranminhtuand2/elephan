import 'package:elephan/src/screen/pagedangkydangnhap/pagedangnhap/dangnhap.dart';
import 'package:elephan/src/screen/pagegioithieu/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class pagetest extends StatelessWidget {
  const pagetest({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("pagetest"),
      ),
      body: Row(
        children: [
          SizedBox(
            child: TextButton(
                onPressed: () {
                  Get.to(() => onBoardingScreen());
                },
                child: Text("onboarding")),
          ),
          SizedBox(
            child: TextButton(
                onPressed: () {
                  Get.to(() => Page_dangnhap());
                },
                child: Text("trangdk.dn")),
          ),
        ],
      ),
    ));
  }
}
