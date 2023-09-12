import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

Widget listViewGrid({
  required List<Product> products,
  required String title,
  Function? onClickTitle,
}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              onClickTitle?.call();
            },
            child: const Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Điều chỉnh canh giữa
              children: [
                // Biểu tượng
                Text("Xem tất cả"), // Nhãn
                SizedBox(width: 4), // Khoảng cách giữa biểu tượng và nhãn
                Icon(CupertinoIcons.forward),
              ],
            ),
          ),
        ],
      ),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 280,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Builder(builder: (context) {
                        return SizedBox(
                          height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/food.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            products[index].storeId.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Text(products[index].nameProduct.toString()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ],
  );
}
