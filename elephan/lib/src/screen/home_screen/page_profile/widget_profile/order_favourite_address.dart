 
  import 'package:flutter/material.dart';

Widget orderFavouriteAddressProfile() {
    return Container(  
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color.fromARGB(255, 108, 108, 108), width: 0.3), bottom: BorderSide(color: Color.fromARGB(255, 108, 108, 108), width: 0.4))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
          
              },
              child: Column(
                children: [
                  Image.asset("assets/images/order.png", width: 70,),
                  const Text("Đơn hàng", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            InkWell(
              onTap: () {
          
              },
              child: Column(
                children: [
                  Image.asset("assets/images/favourite.png", width: 70,),
                  const Text("Yêu thích", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            InkWell(
              onTap: () {
          
              },
              child: Column(
                children: [
                  Image.asset("assets/images/address.png", width: 70,),
                  const Text("Địa chỉ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }