// ignore_for_file: non_constant_identifier_names

import 'package:elephan/src/screen/home_screen/page_profile/widget_profile_detail/avatar.dart';
import 'package:elephan/src/screen/home_screen/page_profile/widget_profile_detail/infomation.dart';
import 'package:elephan/src/screen/home_screen/page_profile/widget_profile_detail/update_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 30,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    avatarProfileDetail(),
                    const InformationProfileDetail(),
                    SizedBox(
                      height: 30,
                      child: Container(
                          color: const Color.fromARGB(255, 230, 230, 230)),
                    ),
                    InkWell(
                        onTap: () {},
                        child: SizedBox(
                            width: double.infinity, child: updatePassword())),
                  ],
                ),
              ),
              Expanded(
                child:
                    Container(color: const Color.fromARGB(255, 230, 230, 230)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
