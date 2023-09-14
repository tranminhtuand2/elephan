import 'package:flutter/material.dart';

Widget orderFavouriteAddressProfile() {
  return Column(
    children: [
      const Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/order.png",
                    width: 60,
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Đơn hàng",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/favourite.png",
                    width: 60,
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Yêu thích",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/address.png",
                    width: 60,
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Địa chỉ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
