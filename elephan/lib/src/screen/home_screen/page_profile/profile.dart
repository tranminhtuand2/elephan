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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Column(
            children: [
              avatarAndNameProfile(context),
              orderFavouriteAddressProfile(),
              const SizedBox(height: 20),
              otherFunctionsProfile(),
            ],
          ),
        ],
      ),
    );
  }
}
