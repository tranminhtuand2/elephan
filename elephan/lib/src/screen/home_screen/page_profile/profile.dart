// ignore_for_file: non_constant_identifier_names

import 'package:elephan/src/screen/home_screen/page_profile/widget_profile/avatar_name.dart';
import 'package:elephan/src/screen/home_screen/page_profile/widget_profile/order_favourite_address.dart';
import 'package:elephan/src/screen/home_screen/page_profile/widget_profile/orther_funtiones.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Column(
                children: [
                  avatarAndNameProfile(context),
                  orderFavouriteAddressProfile(),
                  SizedBox(
                    height: 20,
                    child: Container(
                        color: const Color.fromARGB(255, 230, 230, 230)),
                  ),
                  otherFunctionsProfile(),
                ],
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
