import 'package:flutter/material.dart';

Widget infoProduct() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Text(
              "Cơm tấm Anh Thy - sườn trứng",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "35.000d",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 50, 50, 50)),
            ),
          ),
        ],
      ),
    );
  }