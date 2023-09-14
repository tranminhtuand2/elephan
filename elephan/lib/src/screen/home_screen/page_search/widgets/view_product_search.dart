import 'package:flutter/material.dart';

Widget viewProductSearch() {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 270,
      ),
      itemCount: 15,
      itemBuilder: (context, index) {
        return Container(
          height: double.infinity,
          margin: const EdgeInsets.all(6),
          child: InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          'assets/images/food.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
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
                          child: const Text(
                            'Cơm',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cơm gà siêu ngon',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '100k VND',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
