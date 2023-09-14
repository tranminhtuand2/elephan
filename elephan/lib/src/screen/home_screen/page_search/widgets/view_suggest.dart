import 'package:flutter/material.dart';

Widget viewSuggest() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Đề xuất ❤ ",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          // height: 300, // Độ cao của ListView
          child: Wrap(
            direction: Axis.horizontal, // Thiết lập chiều ngang
            spacing: 12, // Khoảng cách giữa các phần tử
            runSpacing: 12, // Khoảng cách giữa các dòng (khi xuống hàng)
            children: List.generate(
              28,
              (index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'XXX $index',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}
