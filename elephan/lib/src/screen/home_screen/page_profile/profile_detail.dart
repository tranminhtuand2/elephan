// ignore_for_file: non_constant_identifier_names

import 'package:elephan/src/screen/home_screen/page_profile/widget_profile_detail/avatar.dart';
import 'package:elephan/src/screen/home_screen/page_profile/widget_profile_detail/infomation.dart';
import 'package:elephan/src/screen/home_screen/page_profile/widget_profile_detail/update_password.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              avatarProfileDetail(),
              const InformationProfileDetail(),
              updatePassword(),
            ],
          ),
        ),
      ),
    );
  }
}
