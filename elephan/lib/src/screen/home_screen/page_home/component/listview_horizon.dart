import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../models/product.dart';

class viewProductHorizontal extends StatelessWidget {
  final List<Product> products;
  final String title;
  final Function? onClickTitle;
  final bool? reversed;

  const viewProductHorizontal({
    super.key,
    required this.products,
    required this.title,
    this.onClickTitle,
    this.reversed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 16, bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 280,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/food.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
                                  products[index].store!.storeName ?? '',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8, right: 20),
                          child: Text(
                            products[index].store!.describe.toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
